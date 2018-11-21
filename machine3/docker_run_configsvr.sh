 docker run -d --name configsvr2  --network mongodb_ov_net -v /home/mongodb/data/cs/configsvr2:/data/configdb mongo --configsvr --replSet "rs_configsvr"  --bind_ip_all
