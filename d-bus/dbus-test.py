import dbus

bus = dbus.SystemBus()

bus_name = "org.freedesktop.systemd1"
object_path = "/org/freedesktop/systemd1"
interface = "org.freedesktop.systemd1.Manager"

systemd = bus.get_object(bus_name, object_path)
manager = dbus.Interface(systemd, interface)

target = manager.GetDefaultTarget()

print("Default systemd target:")
print(target)
