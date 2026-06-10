# 🏠 homelab

![Estado](https://img.shields.io/badge/estado-en%20construcción-orange)
![Proxmox](https://img.shields.io/badge/Proxmox-VE-E57000)
![Docker](https://img.shields.io/badge/Docker-enabled-2496ED)
![Debian](https://img.shields.io/badge/Debian-13-A81D33)
![Última actualización](https://img.shields.io/badge/update-2026--06--05-blue)

Infraestructura homelab orientada a:

- desarrollo
- self-hosting
- DevOps
- networking
- automatización
- observabilidad
- aprendizaje de infraestructura real

La arquitectura está basada en Proxmox VE con separación entre infraestructura core, servicios Docker y entornos de laboratorio.

## 📦 Estructura del Repositorio

```txt
homelab/
│
├── compose/
│   ├── dashy/
│   ├── portainer/
│   ├── speedtest-tracker/
│   └── uptime-kuma/
│
├── docs/
│   ├── arquitectura.md
│   ├── bitacora.md
│   └── runbooks.md
│
├── inventory/
│   ├── dns.md
│   ├── hosts.md
│   ├── ports.md
│   └── services.md
│
├── scripts/
│   ├── backup.sh
│   ├── prune_docker.sh
│   └── update_hosts.sh
│
├── README.md
└── LICENSE
```

## 🧠 Filosofía del Homelab

```txt
Proxmox Host
    ↓
Infraestructura Base (LXC)
    ↓
Docker Platform
    ↓
Servicios
    ↓
Aplicaciones
    ↓
Desarrollo & Aprendizaje
```

## 🌐 Red Principal

| Configuración | Valor               |
| ------------- | ------------------- |
| Red           | `192.168.1.0/24`    |
| Gateway       | `192.168.1.1`       |
| DNS Principal | `192.168.1.21`      |
| Dominio Local | `home.arpa`         |
| DHCP Clientes | `192.168.1.100-254` |

## 🖥️ Infraestructura Core

| Servicio            | Tipo       | IP              | Hostname              |
| ------------------- | ---------- | --------------- | --------------------- |
| Proxmox VE          | Hypervisor | `192.168.1.20`  | `home.proxmox`        |
| Adguard DNS         | LXC        | `192.168.1.21`  | `home.dns`            |
| Nginx Proxy Manager | LXC        | `192.168.1.22`  | `home.nxinx`          |
| Tailscale           | LXC        | `192.168.1.23`  | `home.tailscale`      |
| Updatime Kuma       | LXC        | `192.168.1.24`  | `home.kuma`           |
| Docker VM           | VM         | `192.168.1.30`  | `home.docker`         |

## 🐳 Plataforma Docker

La VM principal de contenedores utiliza Debian 13 + Docker Engine + Docker Compose.

## Base Stack

- Docker Engine
- Docker Compose
- Portainer
- Dashy
- Speedtest Tracker
- Uptime Kuma
- PostgreSQL planeado
- Redis (planeado)

## 📊 Servicios Desplegados

| Servicio            | URL                    | Función             |
| ------------------- | ---------------------- | ------------------- |
| Portainer           | `home.portainer`       | Gestión Docker      |
| Speedtest Tracker   | `home.speed`           | Monitoreo ISP       |
| Adguard DNS         | `home.dns`             | DNS + Adblock       |
| Nginx Proxy Manager | `home.nginx`           | Reverse Proxy       |

## 🔐 Networking & Seguridad

## DNS

Technitium DNS se utiliza como:

- DNS local
- cache DNS
- split DNS
- adblocking
- registros internos
- wildcards

## Reverse Proxy

Nginx Proxy Manager provee:

- proxy reverso
- SSL interno
- certificados wildcard
- dominios locales

## VPN

Tailscale permite:

- acceso remoto seguro
- subnet router
- exit node
- administración remota sin exponer puertos

## 📁 Almacenamiento

## Storage Principal

| Recurso   | Uso                                  |
| --------- | ------------------------------------ |
| HDD 1TB   | Backups + Volúmenes Docker           |
| NFS Share | Compartido entre Proxmox y Docker VM |

## Punto de montaje

```txt
/mnt/hdd-backup
```

## Estructura Persistente

```txt
/mnt/hdd-backup/docker/
├── portainer/
├── stacks/
├── volumes/
├── backups/
├── git/
└── dashboards/
```

## 🤖 Automatización

## Scripts

| Script            | Función                  |
| ----------------- | ------------------------ |
| `backup.sh`       | Backups automatizados    |

## 💻 Desarrollo

## Servicios planeados

- Gitea
- CI/CD
- PostgreSQL
- Redis
- APIs
- Bots Discord
- Bots Telegram
- Workers Python

## 📄 Licencia

MIT License
