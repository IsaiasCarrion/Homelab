````markdown
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

---

# 📦 Estructura del Repositorio

```txt
homelab/
│
├── assets/
│   └── screenshots/
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
├── ROADMAP.md
└── LICENSE
```
````

---

# 🧠 Filosofía del Homelab

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

Objetivos principales:

- aislamiento de servicios
- troubleshooting simple
- infraestructura modular
- backups independientes
- buenas prácticas DevOps
- networking real
- laboratorio reproducible

---

# 🌐 Red Principal

| Configuración | Valor               |
| ------------- | ------------------- |
| Red           | `192.168.1.0/24`    |
| Gateway       | `192.168.1.1`       |
| DNS Principal | `192.168.1.21`      |
| Dominio Local | `home.arpa`         |
| DHCP Clientes | `192.168.1.100-254` |

---

# 🖥️ Infraestructura Core

| Servicio            | Tipo       | IP              | Hostname              | Estado |
| ------------------- | ---------- | --------------- | --------------------- | ------ |
| Proxmox VE          | Hypervisor | `192.168.1.20`  | `pve.home.arpa`       | ✅     |
| Technitium DNS      | LXC        | `192.168.1.21`  | `dns.home.arpa`       | ✅     |
| Nginx Proxy Manager | LXC        | `192.168.1.22`  | `npm.home.arpa`       | ✅     |
| Tailscale           | LXC        | `192.168.1.23`  | `ts.home.arpa`        | ✅     |
| Docker VM           | VM         | `192.168.1.30`  | `docker.home.arpa`    | ✅     |
| Homelable           | LXC        | `192.168.1.103` | `homelable.home.arpa` | ✅     |

---

# 🐳 Plataforma Docker

La VM principal de contenedores utiliza Debian 13 + Docker Engine + Docker Compose.

## Base Stack

- Docker Engine
- Docker Compose
- Portainer
- Dashy
- Speedtest Tracker
- Uptime Kuma (pendiente)
- PostgreSQL (planeado)
- Redis (planeado)

---

# 📊 Servicios Desplegados

| Servicio            | URL                    | Función             | Estado |
| ------------------- | ---------------------- | ------------------- | ------ |
| Portainer           | `portainer.home.arpa`  | Gestión Docker      | ✅     |
| Dashy               | `dashy.home.arpa`      | Dashboard principal | ✅     |
| Speedtest Tracker   | `speed.home.arpa`      | Monitoreo ISP       | ✅     |
| Technitium DNS      | `dns.home.arpa`        | DNS + Adblock       | ✅     |
| Nginx Proxy Manager | `npm.home.arpa`        | Reverse Proxy       | ✅     |
| Homelable           | `homelable.home.arpa`  | Mapa de red         | ✅     |
| Grafana             | `grafana.home.arpa`    | Observabilidad      | 🚧     |
| Prometheus          | `prometheus.home.arpa` | Métricas            | 🚧     |
| Gitea               | `git.home.arpa`        | Git self-hosted     | 🚧     |

---

# 🔐 Networking & Seguridad

## DNS

Technitium DNS se utiliza como:

- DNS local
- cache DNS
- split DNS
- adblocking
- registros internos
- wildcards

### Blocklist

```txt
https://big.oisd.nl/
```

Modo recomendado:

```txt
NXDOMAIN
```

---

## Reverse Proxy

Nginx Proxy Manager provee:

- proxy reverso
- SSL interno
- certificados wildcard
- dominios locales

---

## VPN

Tailscale permite:

- acceso remoto seguro
- subnet router
- exit node
- administración remota sin exponer puertos

---

# 📁 Almacenamiento

## Storage Principal

| Recurso   | Uso                                  |
| --------- | ------------------------------------ |
| HDD 1TB   | Backups + Volúmenes Docker           |
| NFS Share | Compartido entre Proxmox y Docker VM |

### Punto de montaje

```txt
/mnt/hdd-backup
```

---

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

---

# 📊 Observabilidad

## Herramientas

| Herramienta       | Función                 |
| ----------------- | ----------------------- |
| Dashy             | Dashboard visual        |
| Speedtest Tracker | Monitoreo ISP           |
| Homelable         | Descubrimiento de red   |
| Uptime Kuma       | Healthchecks            |
| Grafana           | Dashboards métricos     |
| Prometheus        | Recolección de métricas |

---

# 🤖 Automatización

## Scripts

| Script            | Función                  |
| ----------------- | ------------------------ |
| `backup.sh`       | Backups automatizados    |
| `prune_docker.sh` | Limpieza Docker          |
| `update_hosts.sh` | Actualización inventario |

---

# 💻 Desarrollo

## Servicios planeados

- Gitea
- CI/CD
- PostgreSQL
- Redis
- APIs
- Bots Discord
- Bots Telegram
- Workers Python
- Ollama
- n8n

---

# 🧪 Labs Futuros

| Proyecto                | Estado |
| ----------------------- | ------ |
| Kubernetes Lab          | 🚧     |
| AI / Ollama             | 🚧     |
| Observabilidad completa | 🚧     |
| GitOps                  | 🚧     |
| CI/CD self-hosted       | 🚧     |
| Authentik               | 🚧     |

---

# 📌 Inventario de Red

## Reserva de IPs

| Rango               | Uso             |
| ------------------- | --------------- |
| `192.168.1.1`       | Router          |
| `192.168.1.2-19`    | Infraestructura |
| `192.168.1.20-29`   | Hypervisors     |
| `192.168.1.30-39`   | Docker / Dev    |
| `192.168.1.40-49`   | Storage         |
| `192.168.1.50-69`   | Labs / AI       |
| `192.168.1.70-99`   | Expansión       |
| `192.168.1.100-254` | DHCP            |

---

# 📸 Capturas

## Dashboards

- [pendiente]
- Dashy
- Portainer
- Homelable
- Grafana

---

# 🚀 Roadmap

## Fase 1 — Core Infra

- [x] Proxmox
- [x] DNS
- [x] Reverse Proxy
- [x] Docker VM
- [x] Tailscale

## Fase 2 — Plataforma Dev

- [x] Portainer
- [x] Dashy
- [x] Speedtest Tracker
- [ ] Gitea
- [ ] PostgreSQL
- [ ] Redis

## Fase 3 — Observabilidad

- [ ] Uptime Kuma
- [ ] Grafana
- [ ] Prometheus
- [ ] Alerting

## Fase 4 — Labs

- [ ] Kubernetes
- [ ] Ollama
- [ ] AI Workloads
- [ ] GitOps

---

# 🔧 Comandos Útiles

## Proxmox

```bash
qm list
pct list
pveversion
```

## Docker

```bash
docker ps
docker compose up -d
docker logs <container>
```

## Networking

```bash
nmap -sn 192.168.1.0/24
ip a
ip route
```

---

# 📚 Aprendizajes

- separación de servicios
- networking básico/intermedio
- reverse proxy
- DNS interno
- troubleshooting
- virtualización
- automatización
- observabilidad
- infraestructura reproducible

---

# 🤝 Contribuir

```bash
git clone https://github.com/[usuario]/homelab.git
cd homelab
```

Abrí un issue o PR si querés sugerir mejoras de arquitectura o tooling.

---

# 📄 Licencia

MIT License

---

# 🚧 Estado del Proyecto

Infraestructura activa en evolución continua.

Actualmente utilizada para:

- desarrollo
- testing
- automatización
- aprendizaje DevOps
- self-hosting
- experimentación

```

```
