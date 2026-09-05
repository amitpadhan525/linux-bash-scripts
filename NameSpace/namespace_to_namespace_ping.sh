sudo ip netns add ns1
sudo ip netns add ns2

sudo ip link add veth-ns1 type veth peer name veth-ns2

sudo ip link set veth-ns1 netns ns1
sudo ip link set veth-ns2 netns ns2

sudo ip netns exec ns1 ip addr add 192.168.10.10/24 dev veth-ns1
sudo ip netns exec ns2 ip addr add 192.168.10.20/24 dev veth-ns2

sudo ip netns exec ns1 ip link set veth-ns1 up
sudo ip netns exec ns2 ip link set veth-ns2 up 

sudo ip netns exec ns1 ip link set lo up
sudo ip netns exec ns2 ip link set lo up 






