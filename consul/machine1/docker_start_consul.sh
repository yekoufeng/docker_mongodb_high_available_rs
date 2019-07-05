docker run -d --restart=always --name=consul --net=host -e CONSUL_BIND_INTERFACE=eth0 consul agent -server=true -client=0.0.0.0 -bind=172.28.183.90 -ui -bootstrap-expect=2
