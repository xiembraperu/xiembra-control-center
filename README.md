# Xiembra Control Center 🚀

> **Centro Operativo y Comercial de Lanzamiento para Xiembra**  
> Plataforma web autónoma diseñada para la gestión diaria de operaciones de **Karla** (asistente operativa y seguimiento en campo) y **Roger** (dirección comercial y estrategia).

---

## 📌 Propósito del Proyecto

Xiembra Control Center es el sistema operativo visual de **Xiembra** (Functional Snacks de Cacao Nativo 65% y Café de Especialidad de Chanchamayo). Su objetivo es unificar en una interfaz limpia y libre de fricción:
* **Control de Lanzamiento:** Separación estricta entre **Ready to Sell** (3–5 ventas piloto inmediatas) y **Ready to Scale** (escalamiento a 5,000 unids/mes).
* **Gestión de Tareas:** Tablero Kanban y tabla interactiva con seguimiento de bloqueos críticos.
* **Directorio de Clientes B2B & Pipeline:** Embudo comercial de 25 cuentas (biomarkets y cafeterías saludables de Lima) con contacto directo vía WhatsApp.
* **Ventas y Facturación Asistida:** Calculadora de pedidos retail (20g) y gourmet (100g), cálculo automático de IGV y generador de mensajes de cobranza BCP.
* **Control de Inventario y Finanzas:** Monitoreo de stock terminado e insumos.
* **Integración Futura con JARVIS:** Asistente de inteligencia ejecutiva 24/7 en la nube para automatizaciones vía WhatsApp.

---

## 🏛️ Separación de Repositorios Oficiales

Para preservar la integridad y seguridad de la información corporativa, Xiembra mantiene dos repositorios independientes:

| Repositorio | Ámbito y Responsabilidad | Tecnologías |
| :--- | :--- | :--- |
| **`xiembraperu/Controlinterno`** | **Operación Central, Obsidian Vault & JARVIS.** Contiene los archivos markdown de tareas atómicas, fichas de clientes, minutas de directorio, prompts de JARVIS y sincronización con el VPS Oracle Cloud. | Obsidian, Markdown, YAML, Python, Vertex AI |
| **`xiembraperu/xiembra-control-center`** | **Plataforma Web & Aplicación Operativa.** Contiene la interfaz gráfica web (`control-center.html`), la landing page comercial (`index.html`), recursos de diseño oficial (`images/`, `fonts/`) y configuración para Vercel. | HTML5, Tailwind CSS, Lucide Icons, Vanilla JS |

---

## 📦 Estructura del Proyecto

```text
xiembra-control-center/
├── control-center.html        # Aplicación web principal (Xiembra Control Center V1)
├── index.html                 # Landing page comercial oficial de Xiembra
├── images/                    # Recursos visuales oficiales (logos, pacarana, productos)
│   ├── xiembra_logo_compacto_verde_nature.png
│   ├── xiembra_logo_compacto_verde_campo.png
│   ├── xiembra_mascota_pacarana_transparente.png
│   └── ...
├── fonts/                     # Tipografías oficiales (Forrest, Sequel Sans, UT-Marmalade)
├── vercel.json                # Configuración de despliegue y caché estático
├── .gitignore                 # Exclusión de node_modules, dist y archivos locales
└── README.md                  # Documentación oficial del repositorio
```

---

## ⚙️ Estado Actual: Versión 1.0 (V1)

### Arquitectura Técnica
* **100% Client-Side:** Single-Page Application autónoma construida en HTML5 y JavaScript ES6 modular.
* **Motor Visual:** Tailwind CSS CDN con la paleta oficial de marca (Verde Campo `#006148`, Verde Nature `#CBEC8A`, Crema `#FAF8F5`).
* **Iconografía:** Lucide Icons (CDN).
* **Tipografías:** Google Fonts (*Outfit* y *Plus Jakarta Sans*).

### Persistencia Actual
* Los datos iniciales (`INITIAL_DATA`) provienen de una extracción estandarizada de las 24 tareas y 25 prospectos del Vault.
* El estado dinámico de modificaciones, creación de tareas y avances de clientes se persiste localmente en el navegador mediante `localStorage['xiembra_control_center_v1']`.
* Incluye función de **Exportar Backup JSON** para respaldo local manual.

### Limitaciones Conocidas en V1
1. **Persistencia por Navegador:** Los cambios realizados por Karla en su equipo no se sincronizan automáticamente con el de Roger (cada navegador mantiene su propio `localStorage`).
2. **Inventario y Ventas:** Actualmente actualizan valores en el DOM de forma volátil, pendientes de ser persistidos dentro del modelo central `appData`.
3. **Sin Conexión Directa a Obsidian:** No escribe directamente en los archivos `.md` locales de la máquina.

---

## 💻 Ejecución Local

No requiere instalación de dependencias, Node.js ni compilación.

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/xiembraperu/xiembra-control-center.git
   ```
2. Abrir `control-center.html` con doble clic o arrastrándolo a cualquier navegador web (Google Chrome, Microsoft Edge, Safari o Mozilla Firefox).
3. Para alternar entre la visión de tareas de Karla y la supervisión de Roger, haz clic en el selector de perfil en la esquina superior derecha.

---

## ☁️ Despliegue en Vercel

El proyecto está listo para desplegarse como sitio estático en Vercel:
* `index.html` sirve como la raíz pública comercial (`https://control.xiembra.pe/` o dominio de Vercel).
* `control-center.html` queda accesible directamente en `/control-center` gracias a la regla `"cleanUrls": true` de `vercel.json`.
* Los recursos de `/images/` y `/fonts/` cuentan con encabezados de caché inmutable y CORS configurados.

---

## 🗺️ Roadmap de Evolución

* [x] **V1.0:** Portal operativo autónomo con Kanban, Pipeline, calculadora de ventas y soporte para Karla/Roger.
* [ ] **V1.1:** Persistencia completa de Inventario y órdenes de Venta en `appData` y `localStorage`.
* [ ] **V1.2:** Despliegue en producción en Vercel con dominio institucional.
* [ ] **V2.0:** Micro-API REST (`/api/tasks`, `/api/clients`, `/api/inventory`) para sincronizar el portal con JARVIS y una base de datos centralizada.
