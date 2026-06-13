# 🏠 Homelab

![Estado](https://img.shields.io/badge/estado-activo-success)
![Proxmox](https://img.shields.io/badge/Proxmox-VE-E57000)
![Docker](https://img.shields.io/badge/Docker-enabled-2496ED)
![Debian](https://img.shields.io/badge/Debian-13-A81D33)
![Licencia](https://img.shields.io/badge/licencia-MIT-blue)

> Infraestructura documentada para aprendizaje, experimentación y self-hosting.

Este repositorio contiene la documentación, configuraciones, procedimientos operativos e inventario de servicios de mi entorno Homelab.

El objetivo principal de este proyecto no es construir la infraestructura más compleja posible, sino desarrollar un entorno simple, reproducible y mantenible que permita aprender tecnologías de infraestructura, administración de sistemas, virtualización, contenedores y prácticas DevOps.

La filosofía del proyecto se basa en tres pilares fundamentales:

- Documentar cada decisión importante.
- Poder reconstruir la infraestructura ante fallos.
- Mantener la complejidad bajo control aplicando el principio KISS (_Keep It Simple, Stupid_).

## 📋 Tabla de Contenidos

- [📂 Estructura de directorios](#-estructura-de-directorios)
- [🐳 Servicios](#-servicios)
- [📚 Documentación](#-documentación)
- [⚙️ Scripts](#️-scripts)

## 📂 Estructura de directorios

La organización del repositorio sigue un enfoque modular para separar la lógica de despliegue, la documentación y los datos de estado:

```text
homelab/
│
├── README.md
├── LICENSE
│
├── compose/
│   ├── dashy/
│   ├── portainer/
│   └── speedtest-tracker/
│
├── docs/
│   ├── arquitectura.md
│   ├── bitacora.md
│   ├── runbooks.md
│   ├── networking.md
│   └── disaster-recovery.md
│
├── assets/
│   ├── dns.md
│   ├── hosts.md
│   ├── ports.md
│   └── services.md
│
└── scripts/
    └── create_lxc.sh
```

- `compose/`: Contiene los archivos `docker-compose.yml` para cada stack de servicios.
- `docs/`: Documentación técnica detallada, bitácoras de cambios, guías operativas,BBDD de la infraestructura (mapeo de puertos, configuración DNS, hosts y servicios).
- `scripts/`: Herramientas de automatización para mantenimiento, como backups y tareas recurrentes.

## 🐳 Servicios

## Infraestructura

| Servicio            | Tipo | Función                     |
| ------------------- | ---- | --------------------------- |
| AdGuard Home        | LXC  | DNS y filtrado de red       |
| Nginx Proxy Manager | LXC  | Reverse Proxy               |
| Tailscale           | LXC  | Acceso remoto seguro        |
| Uptime Kuma         | LXC  | Monitoreo de disponibilidad |

## Aplicaciones

Ejecutadas dentro de DockerLab.

| Servicio          | Función                            |
| ----------------- | ---------------------------------- |
| Portainer         | Administración de Docker           |
| Dashy             | Dashboard de servicios             |
| Speedtest Tracker | Monitoreo de velocidad de Internet |
| MariaDB           | Base de datos de Speedtest Tracker |

## 📚 Documentación

La gestión del conocimiento se encuentra centralizada para asegurar una rápida recuperación ante fallos o cambios en la configuración:

- [Arquitectura](docs/arquitectura.md): Diagrama lógico y diseño de red del entorno.
- [Bitácora](docs/bitacora.md): Registro histórico de cambios, actualizaciones y resolución de incidencias.
- [Runbooks](docs/runbooks.md): Procedimientos operativos estándar (SOP) para tareas comunes y recuperación ante desastres.
- [Networking](docs/networking.md): Topologia y configuracion de red
- [Disaster/Recovery](docs/disaster_recovery.md) Procedimientos de recuperación

## ⚙️ Scripts

La automatización es clave en este entorno. Actualmente contamos con:

- `create_lxc.sh`: Script para crear contenedores LXC con configuración predefinida, incluyendo opciones como nombre del contenedor, imagen base y red interna.

```bash
# Ejemplo de ejecución para crear un nuevo contenedor
chmod +x create_lxc.sh
create_lxc.sh (ID del contenedor)101 (Hostname del contenedor)adguard (IP interna)192.168.1.21 (DISK)4 (RAM)512
```

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Puedes consultar el archivo LICENSE para más detalles sobre las condiciones de uso.
