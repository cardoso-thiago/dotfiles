#!/bin/sh

CPU_USAGE=$((100 - $(vmstat 1 2 | tail -1 | awk '{print $15}')))
MEMORY_USAGE=$(free | awk '/Mem/ {printf("%.2f", $3/$2 * 100)}')

echo "<txt><span weight='Bold' fgcolor='#ed8796'><i> </i></span>${CPU_USAGE}%  <span weight='Bold' fgcolor='#8bd5ca'><i> </i></span>${MEMORY_USAGE}%</txt>"

CPU_PROCESSES=$(ps -eo comm,%cpu --sort=-%cpu | head -n 6 | awk 'NR>1 {print $0}')

MEMORY_PROCESSES=$(ps -eo comm,%mem --sort=-%mem | head -n 6 | awk 'NR>1 {print $0}')

echo "<tool>CPU:
$CPU_PROCESSES

Memory:
$MEMORY_PROCESSES
</tool>"

exit 0