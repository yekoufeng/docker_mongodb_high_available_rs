 docker run -d --name configsvr1  --network mongodb_ov_net -v /home/mongodb/data/cs/configsvr1:/data/configdb mongo --configsvr --replSet "rs_configsvr"  --bind_ip_all
