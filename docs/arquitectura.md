# 🏗️ Arquitectura

## Objetivo

Este documento describe la arquitectura lógica y física del Homelab.

La infraestructura fue diseñada siguiendo los principios:

* KISS (Keep It Simple, Stupid)
* Reproducibilidad
* Documentación como fuente de verdad
* Separación de responsabilidades
* Facilidad de recuperación ante fallos

---

# Infraestructura Física

| Recurso       | Valor             |
| ------------- | ----------------- |
| CPU           | AMD Ryzen 5 4600G |
| RAM           | 16 GB DDR4        |
| Disco Sistema | M.2 SSD 128 GB    |
| Disco Datos   | HDD 1 TB          |
| Hypervisor    | Proxmox VE        |

---

# Arquitectura General

```text
Internet
    │
    ▼
Router ISP
    │
    ▼
Proxmox VE
    │
    ├── AdGuard DNS
    ├── Nginx Proxy Manager
    ├── Tailscale
    ├── Uptime Kuma
    │
    └── DockerLab VM
            ├── Portainer
            ├── Dashy
            ├── Speedtest Tracker
            └── MariaDB
```

---

# Distribución de Responsabilidades

## LXC

Servicios de infraestructura críticos.

* DNS
* Reverse Proxy
* VPN
* Monitoreo

## DockerLab

Servicios de aplicación.

* Dashboards
* Herramientas web
* Bases de datos
* Aplicaciones self-hosted

---

# Filosofía Arquitectónica

La infraestructura prioriza:

1. Simplicidad.
2. Bajo consumo de recursos.
3. Facilidad de mantenimiento.
4. Recuperación rápida.
5. Evolución incremental.

No se busca alta disponibilidad ni complejidad empresarial.
