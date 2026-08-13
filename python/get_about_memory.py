with open("/proc/meminfo",'r') as f:
    data=f.read()
    for line in data.splitlines():
        if line.startswith("MemTotal") or line.startswith("MemFree") or line.startswith("MemAvailable"):

            print(line.split()[-2])

#print(data)
