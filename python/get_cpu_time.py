with open("/proc/stat") as f:
    data=f.read()
for line in data.splitlines():
    #print(data)
    #prefix=line.startswith("cpu")
    if line.split(" ")[0]=="cpu":
        values=line.split(" ")
        print("CPU times:---")
        print(f"User:{values[2]}")
        print(f"Nice:{values[3]}")
        print(f"System:{values[4]}")
        print(f"Idle:{values[5]}")
        print(f"IOWait:{values[6]}")
        print(f"IRQ:{values[7]}")
        print(f"SoftIRQ:{values[8]}")
        print(f"Steal:{values[9]}")
        print(f"Guest:{values[10]}")
        print(f"GuestNice:{values[11]}")

