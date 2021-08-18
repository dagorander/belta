#! /bin/python3

#import socket
from gpiozero import CPUTemperature # pip install gpiozero

#hostname = socket.gethostname()
#cpuTemp = CPUTemperature()
cpu = CPUTemperature()
print(cpu.temperature)

#print("Hostname is: " + hostname)
#print("CPU Temp is: " + cpuTemp.temperature + "C")