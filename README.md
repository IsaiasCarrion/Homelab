# Homelab - Infrastructure & Services

Este repositorio contiene la configuración, despliegue y documentación técnica de mi entorno *self-hosted*. El objetivo de este Homelab es centralizar servicios de monitoreo, gestión de infraestructura y utilidades, garantizando una administración eficiente, escalable y reproducible a través de contenedores Docker y metodologías *Infrastructure as Code* (IaC).

## 📋 Tabla de Contenidos

- [📂 Estructura de directorios](#-estructura-de-directorios)
- [🐳 Servicios](#-servicios)
- [📚 Documentación](#-documentación)
- [🗂️ Assets de infraestructura](#️-assets-de-infraestructura)
- [⚙️ Scripts](#️-scripts)
- [📈 Estado del proyecto](#-estado-del-proyecto)
- [📄 Licencia](#-licencia)

## 📂 Estructura de directorios

La organización del repositorio sigue un enfoque modular para separar la lógica de despliegue, la documentación y los datos de estado:

- `compose/`: Contiene los archivos `docker-compose.yml` para cada stack de servicios.
- `docs/`: Documentación técnica detallada, bitácoras de cambios y guías operativas.
- `assets/`: Base de datos de la infraestructura (mapeo de puertos, configuración DNS, hosts y servicios).
- `scripts/`: Herramientas de automatización para mantenimiento, como backups y tareas recurrentes.

## 🐳 Servicios

Actualmente, el *lab* gestiona los siguientes servicios desplegados mediante Docker:

| Servicio              | Funcionalidad                                                                |
| **Dashy**             | Dashboard centralizado para acceso rápido a todos los servicios.             |
| **Portainer**         | Interfaz de gestión para el ciclo de vida de contenedores Docker.            |
| **Speedtest-Tracker** | Monitoreo y trazabilidad del ancho de banda y latencia de la red.            |
| **Uptime-Kuma**       | Sistema de monitoreo de disponibilidad (*uptime*) con alertas configurables. |

## 📚 Documentación

La gestión del conocimiento se encuentra centralizada para asegurar una rápida recuperación ante fallos o cambios en la configuración:

- [Arquitectura](docs/arquitectura.md): Diagrama lógico y diseño de red del entorno.
- [Bitácora](docs/bitacora.md): Registro histórico de cambios, actualizaciones y resolución de incidencias.
- [Runbooks](docs/runbooks.md): Procedimientos operativos estándar (SOP) para tareas comunes y recuperación ante desastres.

## 🗂️ Assets de infraestructura

La carpeta `assets/` funciona como el motor de datos de la infraestructura. Aquí se define el estado deseado y la configuración lógica del *lab*:

- `dns.md`: Configuración de registros DNS locales y resolución de nombres.
- `hosts.md`: Inventario de dispositivos físicos y virtuales que componen el entorno.
- `ports.md`: Matriz de asignación de puertos para evitar conflictos en los servicios expuestos.
- `services.md`: Definición y metadatos de los servicios *self-hosted*.

## ⚙️ Scripts

La automatización es clave en este entorno. Actualmente contamos con:

- `backup.sh`: Script destinado a la creación de copias de seguridad de las configuraciones y volúmenes críticos para garantizar la persistencia de datos.

```bash
# Ejemplo de ejecución para backup
chmod +x scripts/backup.sh
./scripts/backup.sh
```

## 📈 Estado del proyecto

Este proyecto se encuentra en constante evolución. El lab está en fase de refinamiento técnico, donde se busca mejorar la automatización, la seguridad perimetral y la documentación exhaustiva de cada componente.

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Puedes consultar el archivo LICENSE para más detalles sobre las condiciones de uso.
