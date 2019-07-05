docker run -d --restart=always --name=consul --net=host -e CONSUL_BIND_INTERFACE=eth0 consul agent -server -client=0.0.0.0 -ui -bootstrap-expect=2 -retry-join=172.28.183.90
