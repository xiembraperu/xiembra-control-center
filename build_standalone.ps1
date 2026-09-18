# Script de compilacion y sincronizacion limpia para XIEMBRA
$imgMap = @{
    "images/xiembra_logo_compacto_verde_campo.png" = "images/xiembra_logo_compacto_verde_campo.png"
    "images/xiembra_logo_compacto_verde_nature.png" = "images/xiembra_logo_compacto_verde_nature.png"
    "images/xiembra_portada_hero_panoramica.jpeg" = "images/xiembra_portada_hero_panoramica.jpeg"
    "images/xiembra_mascota_pacarana_transparente.png" = "images/xiembra_mascota_pacarana_transparente.png"
    "images/xiembra_producto_caja_100g_pacarana.jpg" = "images/xiembra_producto_caja_100g_pacarana.jpg"
    "images/xiembra_producto_bolsita_20g.jpg" = "images/xiembra_producto_bolsita_20g.jpg"
    "images/xiembra_producto_cafe_especialidad_100g.jpg" = "images/xiembra_producto_cafe_especialidad_100g.jpg"
}

$base64Map = @{}

foreach ($key in $imgMap.Keys) {
    $filePath = $imgMap[$key]
    if (Test-Path $filePath) {
        $bytes = [System.IO.File]::ReadAllBytes($filePath)
        $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
        $mime = if ($ext -eq ".png") { "image/png" } elseif ($ext -eq ".jpg" -or $ext -eq ".jpeg") { "image/jpeg" } else { "image/png" }
        $b64 = [System.Convert]::ToBase64String($bytes)
        $base64Map[$key] = "data:$mime;base64,$b64"
        Write-Output "Encoded $key ($($bytes.Length) bytes)"
    } else {
        Write-Warning "File not found: $filePath"
    }
}

$srcFile = if (Test-Path "template_clean.html") { "template_clean.html" } else { "index.html" }
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$html = [System.IO.File]::ReadAllText($srcFile, $utf8NoBom)

foreach ($key in $base64Map.Keys) {
    $uri = $base64Map[$key]
    $html = $html.Replace("src=""$key""", "src=""$uri""")
    $html = $html.Replace("content=""$key""", "content=""$uri""")
    $html = $html.Replace("this.src='$key'", "this.src='$uri'")
}

# Write root index.html
[System.IO.File]::WriteAllText("index.html", $html, $utf8NoBom)
Write-Output "Updated index.html (Size: $( (Get-Item index.html).Length ) bytes)"

# Synchronize clean dist/ target for Vercel
if (!(Test-Path "dist")) { New-Item -ItemType Directory -Path "dist" | Out-Null }
[System.IO.File]::WriteAllText("dist/index.html", $html, $utf8NoBom)
Write-Output "Updated dist/index.html (Autonomous Standalone Bundle)"

Write-Output "Build and synchronization completed with zero redundancy!"
