#!/usr/bin/env bash

# Salir inmediatamente si algún comando falla
set -e

# --- 1. VALIDACIÓN DE ARGUMENTOS ---
if [ "$#" -ne 5 ]; then
    echo "❌ Error: Faltan argumentos."
    echo "💡 Uso: $0 <ID> <HOSTNAME> <IP> <DISK_GB> <RAM_MB>"
    echo "📦 Ejemplo: bash $0 101 adguard 192.168.1.21 4 512"
    exit 1
fi

ID=$1
HOSTNAME=$2
IP=$3
DISK=$4
RAM=$5

# --- 2. CONFIGURACIÓN DEL TEMPLATE ---
# Usamos Debian 13 como pediste.
TEMPLATE_FILE="debian-13-standard_13.1-2_amd64.tar.zst"
TEMPLATE="local:vztmpl/${TEMPLATE_FILE}"

# --- 3. COMPROBACIONES DE SEGURIDAD ---
# Verificar si el ID ya está en uso en Proxmox
if pct status $ID &>/dev/null; then
    echo "❌ Error: El contenedor con ID $ID ya existe. Elegí otro ID."
    exit 1
fi

# Verificar si el template existe localmente, si no, lo descarga
if [ ! -f "/var/lib/vz/template/cache/${TEMPLATE_FILE}" ]; then
    echo "⚠️ El template no está en caché. Actualizando lista y descargando ${TEMPLATE_FILE}..."
    pveam update
    pveam download local $TEMPLATE_FILE
fi

# --- 4. CREACIÓN DEL CONTENEDOR ---
echo "🚀 Creando LXC: $HOSTNAME (ID: $ID, IP: $IP)..."

pct create $ID $TEMPLATE \
    --hostname $HOSTNAME \
    --cores 1 \
    --memory $RAM \
    --swap 512 \
    --rootfs local-lvm:${DISK} \
    --net0 name=eth0,bridge=vmbr0,ip=${IP}/24,gw=192.168.1.1 \
    --features nesting=1,keyctl=1 \
    --unprivileged 1 \
    --password osbourne33

echo "✅ LXC creado. Iniciando..."
pct start $ID

# --- 5. POST-CREACIÓN ---
echo "⏳ Esperando 10 segundos a que el contenedor levante la red..."
sleep 10

# Prueba de conexión a internet dentro del CT
if pct exec $ID -- ping -c 1 8.8.8.8 &>/dev/null; then
    echo "🌐 Red confirmada. El contenedor tiene salida a internet."
else
    echo "⚠️ Advertencia: El contenedor está corriendo pero parece no tener internet. Revisá tu gateway."
fi

echo "🎉 ¡Contenedor $HOSTNAME ($ID) listo para usarse!"
