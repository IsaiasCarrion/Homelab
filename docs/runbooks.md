# 📚 Runbooks

## Objetivo

Documentar procedimientos operativos recurrentes.

---

# Reiniciar un LXC

```bash
pct stop <ID>
pct start <ID>
```

Ejemplo:

```bash
pct restart 100
```

---

# Reiniciar una VM

```bash
qm stop <ID>
qm start <ID>
```

Ejemplo:

```bash
qm restart 110
```

---

# Verificar Estado de Contenedores Docker

```bash
docker ps
```

---

# Actualizar Contenedores Docker

```bash
docker compose pull
docker compose up -d
```

---

# Verificar Espacio en Disco

```bash
df -h
```

---

# Verificar Uso de Memoria

```bash
free -h
```

---

# Verificar Estado de Proxmox

```bash
pveversion
```

---

# Checklist Mensual

* Revisar espacio en disco.
* Revisar backups.
* Revisar certificados.
* Actualizar contenedores.
* Verificar acceso remoto.
* Verificar DNS.
