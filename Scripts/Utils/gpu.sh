#!/usr/bin/env bash

# Modelo
model=$(lspci | grep VGA | grep AMD | cut -d ':' -f3- | sed 's/^ *//')

# Ruta hwmon
hwmon_path=$(readlink -f /sys/class/drm/card*/device/hwmon/hwmon*)

# Temperatura (miligrados Celsius)
temp=$(cat "$hwmon_path/temp1_input")
temp_c=$(awk "BEGIN {print $temp/1000}")

# Frecuencia (si está disponible)
if [ -f "$hwmon_path/freq1_input" ]; then
  freq=$(cat "$hwmon_path/freq1_input")
  freq_mhz=$(awk "BEGIN {print $freq/1000000 \" MHz\"}")
else
  freq_mhz="N/A"
fi

gpu_busy_percent=$(cat /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null)
if [ $? -eq 0 ]; then
  gpu_usage="${gpu_busy_percent}%"
else
  gpu_usage="N/A"
fi

echo "Modelo: $model"
echo "Frecuencia: $freq_mhz"
echo "Temperatura: $temp_c °C"
echo "Uso de GPU: $gpu_usage"
