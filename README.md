# XIEMBRA — WEB PÚBLICA & LANDING PAGE

Sitio web público, catálogo comercial y página de aterrizaje oficial de **Xiembra**.

---

## 1. ARQUITECTURA OFICIAL DE REPOSITORIOS DE XIEMBRA

El ecosistema digital de Xiembra está estructurado en 3 repositorios oficiales desacoplados:

1. **`xiembraperu/Controlinterno`**
   * **Responsabilidad:** Operación Central, Obsidian Vault corporativo, base de datos de conocimiento y automatizaciones de JARVIS.
   * **Acceso:** Confidencial / Operaciones.

2. **`xiembraperu/xiembra-web`** (este repositorio)
   * **Responsabilidad:** Landing page comercial pública para clientes finales (`index.html`), presentación de marca, catálogo botánico de productos y canal oficial de pedidos vía WhatsApp.
   * **Acceso:** Público / Clientes.

3. **`xiembraperu/xiembra-controlcenter`**
   * **Responsabilidad:** Dashboard operativo SPA (`control-center.html`) para gestión de inventario, CRM B2B, registro contable de ventas y proyecciones.
   * **Acceso:** Privado / Gestión interna.

---

## 2. ESTRUCTURA DEL PROYECTO WEB

* **`index.html`**: Versión autónoma compilada de distribución (*standalone bundle*) con todas las imágenes de producto e identidad embebidas en formato Base64 de alta resolución.
* **`template_clean.html`**: Código fuente limpio y editable de la Landing, con enlaces relativos a la carpeta `images/`.
* **`build_standalone.ps1`**: Script de compilación que lee `template_clean.html`, convierte las imágenes locales a Base64 e inyecta el contenido en `dist/index.html` e `index.html`.
* **`images/`**: Banco de imágenes fotográficas oficiales de empaques, barras, granos de café, mascota Pacarana e identidad botánica.
* **`fonts/`**: Fuentes tipográficas corporativas oficiales (Sequel Sans, Forrest, Marmalade).
* **`catalogo_de_activos.md` / `catalogo_de_activos.json`**: Documentación detallada del catálogo de activos y copywriting.
* **`contexto.md` / `design.md`**: Guías de diseño, principios botánicos y narrativa de marca.
* **`vercel.json`**: Reglas de optimización de entrega y caché para fuentes e imágenes en la nube.

---

## 3. EJECUCIÓN LOCAL

Para previsualizar la Landing en un entorno local:

1. Abrir `index.html` o `template_clean.html` directamente en cualquier navegador web.
2. O iniciar un servidor web local:
   ```bash
   npx serve .
   # O con Python:
   python -m http.server 3000
   ```
3. Navegar a `http://localhost:3000/`.

---

## 4. DESPLIEGUE EN VERCEL

* **Repositorio conectado:** `xiembraperu/xiembra-web` (rama `main`).
* **Root Directory:** `./`
* **Framework Preset:** Other
* **Punto de entrada:** `index.html`
* **Dominio:** Dominio comercial oficial de la marca (ej. `xiembra.pe` o `xiembra.com`).
