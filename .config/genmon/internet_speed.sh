#!/bin/sh

sleep 15

if curl -s --head --request GET http://clients3.google.com/generate_204 | grep "204 No Content" > /dev/null; then
  echo "<txt><span weight='Bold' fgcolor='#f5a97f'><i> </i></span>$(speedtest --secure --no-upload --simple | awk 'NR==2{print $2" Mbps"}')</txt>"
else
  echo "<txt><span weight='Bold' fgcolor='#e64553'><i> </i></span></txt>"
fi

exit 0