# 🌐 Networking

## Red Principal

| Dispositivo         | IP           |
| ------------------- | ------------ |
| Router ISP          | 192.168.1.1  |
| Proxmox VE          | 192.168.1.20 |
| AdGuard Home        | 192.168.1.21 |
| Nginx Proxy Manager | 192.168.1.22 |
| Tailscale           | 192.168.1.23 |
| Uptime Kuma         | 192.168.1.24 |
| DockerLab           | 192.168.1.30 |

---

# DNS

## Resolver Principal

AdGuard Home

Funciones:

* Resolución DNS
* Bloqueo de publicidad
* Gestión de dominios internos

---

# Acceso Remoto

## Tailscale

Permite:

* Administración remota.
* Acceso seguro a servicios internos.
* Eliminación de exposición innecesaria de puertos.

---

# Reverse Proxy

## Nginx Proxy Manager

Responsabilidades:

* Gestión de certificados SSL.
* Publicación de servicios.
* Proxy inverso.
* Consolidación de accesos.

---

# Segmentación

Actualmente toda la infraestructura opera dentro de una red local única.

Futuras mejoras podrán incluir:

* VLANs
* Segmentación por servicios
* Redes de administración
* Redes IoT
