#! /bin/python3

import socket
from gpiozero import CPUTemperature

hostname = socket.gethostname()
cpuTemp = CPUTemperature()

print("Hostname is: " + hostname)
print("CPU Temp is: " + cpuTemp + "C")