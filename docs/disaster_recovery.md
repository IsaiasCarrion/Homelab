# 🚨 Disaster Recovery

## Objetivo

Definir procedimientos de recuperación ante fallos.

---

# Escenario 1: Falla de un Servicio Docker

## Síntomas

* Servicio inaccesible.
* Error en Portainer.
* Error en Dashboard.

## Recuperación

Verificar:

```bash
docker ps -a
```

Revisar logs:

```bash
docker logs <container>
```

Recrear:

```bash
docker compose down
docker compose up -d
```

---

# Escenario 2: Falla de un LXC

Verificar estado:

```bash
pct list
```

Reiniciar:

```bash
pct restart <ID>
```

Revisar logs:

```bash
journalctl -xe
```

---

# Escenario 3: Pérdida de Disco

Procedimiento:

1. Reemplazar disco.
2. Reinstalar Proxmox.
3. Restaurar backups.
4. Recrear LXCs.
5. Recrear DockerLab.
6. Restaurar configuraciones.

---

# Escenario 4: Migración de Hardware

Objetivo:

Restaurar infraestructura completa en nuevo servidor.

Pasos:

1. Instalar Proxmox.
2. Configurar red.
3. Restaurar backups.
4. Restaurar LXCs.
5. Restaurar VM DockerLab.
6. Verificar servicios.

---

# Objetivo de Recuperación

RTO (Recovery Time Objective)

Objetivo actual:

* Infraestructura básica: < 4 horas
* Servicios Docker: < 1 hora
