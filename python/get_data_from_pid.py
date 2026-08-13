pid= int(input("Enter PID for details: "))

with open(f"/proc/{pid}/status",'r') as f:
    data=f.read()

print(data)
