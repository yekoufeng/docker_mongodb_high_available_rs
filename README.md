注：本例部署是在创建的mongodb用户下进行的(/home/mongodb)，你自己的部署应根据你自己部署的实际目录。
# key生成和预拷贝
- openssl rand -base64 745 > /home/mongodb/key.file
- chmod 600 /home/mongodb/key.file
- 拷贝所有.example结尾的文件到/home/mongodb目录，去掉.example后缀(注：key.file,根据每套集群环境不一样而不同，需要自己重新生成)

# 启动步骤：
## 分别运行machine1,machine2,machine3, ... 上的docker_run_configsvr.sh,把这3个configsvr初始化到一个副本集

rs.initiate(
{
_id: "rs_configsvr",
configsvr: true,
members: [
{ _id : 0, host : "10.0.0.2:27019" },
{ _id : 1, host : "10.0.0.3:27019" },
{ _id : 2, host : "10.0.0.4:27019" }
]
}
)

## 分别运行machine1,machine2,machine3, ... 上的docker_run_shardsvr.sh，分别把3台机器的shardsvr加入到对应集群
rs.initiate(
{
_id : "rs_shardsvr0",
members: [
{ _id : 0, host : "10.0.0.5:27018" },
{ _id : 1, host : "10.0.0.8:27018" },
{ _id : 2, host : "10.0.0.11:27018" }
]
}
)


rs.initiate(
{
_id : "rs_shardsvr1",
members: [
{ _id : 0, host : "10.0.0.6:27018" },
{ _id : 1, host : "10.0.0.9:27018" },
{ _id : 2, host : "10.0.0.12:27018" }
]
}
)

rs.initiate(
{
_id : "rs_shardsvr2",
members: [
{ _id : 0, host : "10.0.0.7:27018" },
{ _id : 1, host : "10.0.0.10:27018" },
{ _id : 2, host : "10.0.0.13:27018" }
]
}
)


## 分别运行machine1,machine2,machine3, ... 上的docker_run_mongos.sh
在任意一台上的mongos上执行

sh.addShard("rs_shardsvr0/10.0.0.5:27018,10.0.0.8:27018,10.0.0.11:27018")
sh.addShard("rs_shardsvr1/10.0.0.6:27018,10.0.0.9:27018,10.0.0.12:27018")
sh.addShard("rs_shardsvr2/10.0.0.7:27018,10.0.0.10:27018,10.0.0.13:27018")
