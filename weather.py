#!/usr/bin/python

from Adafruit_BMP085 import BMP085
import re, os, rrdtool, time

# function: read and parse sensor data file
def read_sensor(path):
  value = "U"
  try:
    f = open(path, "r")
    line = f.readline()
    if re.match(r"([0-9a-f]{2} ){9}: crc=[0-9a-f]{2} YES", line):
      line = f.readline()
      m = re.match(r"([0-9a-f]{2} ){9}t=([+-]?[0-9]+)", line)
      if m:
        value = str(float(m.group(2)) / 1000.0)
    f.close()
  except (IOError), e:
    print time.strftime("%x %X"), "Error reading", path, ": ", e
  return value

# define pathes to 1-wire sensor data
path = ("/sys/bus/w1/devices/10-0008002ff245/w1_slave")

# read sensor data
tempout = float(read_sensor(path))

time.sleep(1)


#########################################################################

# Initialise the BMP085 and use STANDARD mode
bmp = BMP085(0x77)

tempin = bmp.readTemperature()

# Read the current barometric pressure level
pressure = bmp.readPressure()

# Set the altitude of your current location in meter
altitude = 301
psea = pressure / pow(1.0 - altitude/44330.0, 5.255)

print "Outside Temp:             %.2f C"  % tempout
print "Inside Temp:              %.2f C"  % tempin
print "Pressure:                %.2f hPa" % (pressure / 100.0)
print "Pressure at sea level: %8.2f hPa"  % (psea / 100.0)

time.sleep(1)

# insert data into round-robin-database
data = "N:%.2f:%.2f:%8.2f" % (tempin, tempout, psea/100.0)

rrdtool.update(
  "%s/weather.rrd" % (os.path.dirname(os.path.abspath(__file__))),
  data)
