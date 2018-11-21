docker run --name shardsvr20 -d --network mongodb_ov_net  -v /home/mongodb/data/sh/shardsvr00:/data/db mongo --shardsvr --replSet "rs_shardsvr2"  --bind_ip_all 
docker run --name shardsvr21 -d --network mongodb_ov_net  -v /home/mongodb/data/sh/shardsvr01:/data/db mongo --shardsvr --replSet "rs_shardsvr2"  --bind_ip_all 
docker run --name shardsvr22 -d --network mongodb_ov_net  -v /home/mongodb/data/sh/shardsvr02:/data/db mongo --shardsvr --replSet "rs_shardsvr2"  --bind_ip_all 

