 docker run -d --name configsvr0  --network mongodb_ov_net -v /home/mongodb/data/cs/configsvr0:/data/configdb mongo --configsvr --replSet "rs_configsvr"  --bind_ip_all
