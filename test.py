#! /bin/python3

#import socket
#from gpiozero import CPUTemperature # pip install gpiozero

import vcgencmd
CPUc=vcgencmd.measure_temp()
print str(CPUc)

chmod +x cputemp
sudo cp cputemp /usr/bin

#hostname = socket.gethostname()
#cpuTemp = CPUTemperature()
#cpu = CPUTemperature()
#print(cpu.temperature)

#print("Hostname is: " + hostname)
#print("CPU Temp is: " + cpuTemp.temperature + "C")