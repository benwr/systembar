while true; do
  timedate=$(date +'%Y-%m-%d %H:%M:%S')
  battery=$(acpi | sed -e 's/.*: \(.*\), \(.*\), .*/\1 \2/')
  connection=$(iwctl station wlan0 show | grep 'Connected network' | awk '{print $3 $4 $5 $6 $7 $8}')
  disconnection=$(iwctl station wlan0 show | grep disconnected | awk '{print $2}')
  volume=$(pamixer --get-volume)
  load=$(awk '{print $1}' < /proc/loadavg)
  freemem=$(free -h | grep 'Mem:' | awk '{print $4}')
  freeswap=$(free -h | grep 'Swap:' | awk '{print $4}')
  
  echo 'free mem: '$freemem' swap: '$freeswap' | cpu '$load' | volume '$volume'% | '$connection$disconnection' | '$battery' | '$timedate
  
  sleep 0.5
done

