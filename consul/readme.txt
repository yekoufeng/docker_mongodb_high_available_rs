docker run -d --restart=always --name=consul --net=host -e CONSUL_BIND_INTERFACE=eth0 consul agent -server=true -client=0.0.0.0 -bind=172.28.183.106 -ui -bootstrap-expect=2
docker run -d --restart=always --name=consul --net=host -e CONSUL_BIND_INTERFACE=eth0 consul agent -server -client=0.0.0.0 -ui -bootstrap-expect=2 -retry-join=172.28.183.106
docker exec -t consul consul members 
docker exec -t consul consul operator raft list-peers

75£º
ExecStart=/usr/bin/dockerd --cluster-store=consul://172.28.172.148:8500 --cluster-advertise=172.28.172.147:2375
76£º
ExecStart=/usr/bin/dockerd --cluster-store=consul://172.28.172.148:8500 --cluster-advertise=172.28.172.148:2375
78£º
ExecStart=/usr/bin/dockerd --cluster-store=consul://172.28.172.148:8500 --cluster-advertise=172.28.172.149:2375