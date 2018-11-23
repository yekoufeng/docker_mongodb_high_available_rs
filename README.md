# docker_mongodb_high_available_rs
高可用的mongodb分片集群搭建-对应真实生产环境
# 启动步骤：
## 分别运行machine1,machine2,machine3, ... 上的docker_run_configsvr.sh,把这3个configsvr初始化到一个副本集
rs.initiate(
{
_id: "rs_configsvr",
configsvr: true,
members: [
{ _id : 0, host : "10.0.1.2:27019" },
{ _id : 1, host : "10.0.1.3:27019" },
{ _id : 2, host : "10.0.1.4:27019" }
]
}
)

## 分别运行machine1,machine2,machine3, ... 上的docker_run_shardsvr.sh，分别把3台机器的shardsvr加入到对应集群
rs.initiate(
{
_id : "rs_shardsvr0",
members: [
{ _id : 0, host : "10.0.1.5:27018" },
{ _id : 1, host : "10.0.1.8:27018" },
{ _id : 2, host : "10.0.1.11:27018" }
]
}
)


rs.initiate(
{
_id : "rs_shardsvr1",
members: [
{ _id : 0, host : "10.0.1.6:27018" },
{ _id : 1, host : "10.0.1.9:27018" },
{ _id : 2, host : "10.0.1.12:27018" }
]
}
)

rs.initiate(
{
_id : "rs_shardsvr2",
members: [
{ _id : 0, host : "10.0.1.7:27018" },
{ _id : 1, host : "10.0.1.10:27018" },
{ _id : 2, host : "10.0.1.13:27018" }
]
}
)


## 分别运行machine1,machine2,machine3, ... 上的docker_run_mongos.sh
在任意一台上的mongos上执行
sh.addShard("rs_shardsvr0/10.0.1.5:27018,10.0.1.8:27018,10.0.1.11:27018")
sh.addShard("rs_shardsvr1/10.0.1.6:27018,10.0.1.9:27018,10.0.1.12:27018")
sh.addShard("rs_shardsvr2/10.0.1.7:27018,10.0.1.10:27018,10.0.1.13:27018")
