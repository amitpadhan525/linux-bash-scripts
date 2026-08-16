import pyudev

context=pyudev.Context()

for device in context.list_devices(subsystem="usb"):
    print(device)
