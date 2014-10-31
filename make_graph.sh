#!/bin/bash
time4graph=`date +"%H\:%M\:%S"`
date4graph=`date +"%d.%B %Y"`
#sudo sed -i '$d' /var/www/index.html
#sudo sed -i '$s/$/\n<\/body><\/html>/' /var/www/index.html

rrdtool graph /var/www/temp-day.png \
  -s 'now-1d' -e 'now' \
  -w 1024 -h 300 -a PNG \
  --title "Temperatur (letzte 24h) in [°C]" \
  --x-grid MINUTE:15:HOUR:1:MINUTE:120:0:%R \
  --alt-y-grid \
  --alt-autoscale \
  --units-exponent 0 \
  --watermark "`date`" \
  --slope-mode \
  --color BACK#363636 \
  --color CANVAS#000000 \
  --color GRID#999999 \
  --color MGRID#B5B5B5 \
  --color FONT#CCCCCC \
  DEF:tempin=weather.rrd:tempin:AVERAGE \
  LINE2:tempin#BBBBFF:Werkstatt \
  DEF:tempout=weather.rrd:tempout:AVERAGE \
  LINE2:tempout#6666FF:Aussen \
  COMMENT:" \\n" \
  GPRINT:tempin:MIN:"Minimal (W) %6.2lf °C" \
  GPRINT:tempin:MAX:"Maximal (W) %6.2lf °C" \
  GPRINT:tempin:AVERAGE:"Durchschnitt (W) %6.2lf °C" \
  GPRINT:tempin:LAST:"Aktuell (W) %6.2lf °C\n" \
  GPRINT:tempout:MIN:"Minimal (A) %6.2lf °C" \
  GPRINT:tempout:MAX:"Maximal (A) %6.2lf °C" \
  GPRINT:tempout:AVERAGE:"Durchschnitt (A) %6.2lf °C" \
  GPRINT:tempout:LAST:"Aktuell (A) %6.2lf °C\n" \
  COMMENT:"Erstellt um ${time4graph} am ${date4graph}\n"

rrdtool graph /var/www/temp-week.png \
  -s 'now-1week' -e 'now' \
  -w 1024 -h 300 -a PNG \
  --title "Temperatur (letzte 7 Tage) [°C]" \
  --x-grid HOUR:6:DAY:1:DAY:1:0:%a \
  --alt-y-grid \
  --alt-autoscale \
  --units-exponent 0 \
  --watermark "`date`" \
  --slope-mode \
  --color BACK#363636 \
  --color CANVAS#000000 \
  --color GRID#999999 \
  --color MGRID#B5B5B5 \
  --color FONT#CCCCCC \
  DEF:tempin=weather.rrd:tempin:AVERAGE \
  LINE2:tempin#BBBBFF:Werkstatt \
  DEF:tempout=weather.rrd:tempout:AVERAGE \
  LINE2:tempout#6666FF:Aussen \
  COMMENT:" \\n" \
  GPRINT:tempin:MIN:"Minimal (W) %6.2lf °C" \
  GPRINT:tempin:MAX:"Maximal (W) %6.2lf °C" \
  GPRINT:tempin:AVERAGE:"Durchschnitt (W) %6.2lf °C" \
  GPRINT:tempin:LAST:"Aktuell (W) %6.2lf °C\n" \
  GPRINT:tempout:MIN:"Minimal (A) %6.2lf °C" \
  GPRINT:tempout:MAX:"Maximal (A) %6.2lf °C" \
  GPRINT:tempout:AVERAGE:"Durchschnitt (A) %6.2lf °C" \
  GPRINT:tempout:LAST:"Aktuell (A) %6.2lf °C\n" \
  COMMENT:"Erstellt um ${time4graph} am ${date4graph}\n"

rrdtool graph /var/www/temp-month.png \
  -s 'now-1month' -e 'now' \
  -w 1024 -h 300 -a PNG \
  --title "Temperatur (letzter Monat) [°C]" \
  --x-grid HOUR:12:DAY:1:DAY:1:0:%e \
  --alt-y-grid \
  --alt-autoscale \
  --units-exponent 0 \
  --watermark "`date`" \
  --slope-mode \
  --color BACK#363636 \
  --color CANVAS#000000 \
  --color GRID#999999 \
  --color MGRID#B5B5B5 \
  --color FONT#CCCCCC \
  DEF:tempin=weather.rrd:tempin:AVERAGE \
  LINE2:tempin#BBBBFF:Werkstatt \
  DEF:tempout=weather.rrd:tempout:AVERAGE \
  LINE2:tempout#6666FF:Aussen \
  COMMENT:" \\n" \
  GPRINT:tempin:MIN:"Minimal (W) %6.2lf °C" \
  GPRINT:tempin:MAX:"Maximal (W) %6.2lf °C" \
  GPRINT:tempin:AVERAGE:"Durchschnitt (W) %6.2lf °C" \
  GPRINT:tempin:LAST:"Aktuell (W) %6.2lf °C\n" \
  GPRINT:tempout:MIN:"Minimal (A) %6.2lf °C" \
  GPRINT:tempout:MAX:"Maximal (A) %6.2lf °C" \
  GPRINT:tempout:AVERAGE:"Durchschnitt (A) %6.2lf °C" \
  GPRINT:tempout:LAST:"Aktuell (A) %6.2lf °C\n" \
  COMMENT:"Erstellt um ${time4graph} am ${date4graph}\n"

rrdtool graph /var/www/pressure-day.png \
  -s 'now-1d' -e 'now' \
  -w 1024 -h 300 -a PNG \
  --title "Luftdruck (letzte 24h) [hPa]" \
  --x-grid HOUR:3:HOUR:3:HOUR:3:0:%R \
  --alt-y-grid \
  --alt-autoscale \
  --units-exponent 0 \
  --watermark "`date`" \
  --slope-mode \
  --color BACK#363636 \
  --color CANVAS#000000 \
  --color GRID#999999 \
  --color MGRID#B5B5B5 \
  --color FONT#CCCCCC \
  DEF:pnn=weather.rrd:pnn:AVERAGE \
  LINE2:pnn#FF0000: \
  GPRINT:pnn:MIN:"Minimal %8.2lf hPa" \
  GPRINT:pnn:MAX:"Maximal %8.2lf hPa" \
  GPRINT:pnn:AVERAGE:"Durchschnitt %8.2lf hPa" \
  GPRINT:pnn:LAST:"Aktuell %8.2lf hPa\n" \
  COMMENT:"Erstellt um ${time4graph} am ${date4graph}\n"

rrdtool graph /var/www/pressure-week.png \
  -s 'now-1week' -e 'now' \
  -w 1024 -h 300 -a PNG \
  --title "Luftdruck (letzte 7 Tage) [hPa]" \
  --x-grid HOUR:6:DAY:1:DAY:1:0:%a \
  --alt-y-grid \
  --alt-autoscale \
  --units-exponent 0 \
  --watermark "`date`" \
  --slope-mode \
  --color BACK#363636 \
  --color CANVAS#000000 \
  --color GRID#999999 \
  --color MGRID#B5B5B5 \
  --color FONT#CCCCCC \
  DEF:pnn=weather.rrd:pnn:AVERAGE \
  LINE2:pnn#FF0000: \
  GPRINT:pnn:MIN:"Minimal %8.2lf hPa" \
  GPRINT:pnn:MAX:"Maximal %8.2lf hPa" \
  GPRINT:pnn:AVERAGE:"Durchschnitt %8.2lf hPa" \
  GPRINT:pnn:LAST:"Aktuell %8.2lf hPa\n" \
  COMMENT:"Erstellt um ${time4graph} am ${date4graph}\n"
  
