DROP DATABASE IF EXISTS c2c;
CREATE DATABASE c2c; 
USE c2c;

#管理员信息表  
CREATE TABLE admininformation(
	`id` INT(11) NOT NULL PRIMARY KEY COMMENT '主键',
	`ano` CHAR(12) NOT NULL COMMENT '用户学号',
	`password` CHAR(24) NOT NULL COMMENT '密码',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8

#管理员操作表  
CREATE TABLE adminoperation(
	`id` INT(11) NOT NULL PRIMARY KEY COMMENT '主键',
	`aid` INT(11) NOT NULL COMMENT '母分类id',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`operation` VARCHAR(255) NOT NULL COMMENT '操作'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8

#商品类型表
CREATE TABLE allkinds(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`name` VARCHAR(50) NOT NULL COMMENT '分类名称',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间'
)ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为7 数据库默认编码为utf-8

#已购买的商品表
CREATE TABLE boughtshop(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`state` INT(11) NOT NULL COMMENT '商品当前的状态',
	`uid` INT(11) NOT NULL COMMENT '用户id',
	`sid` INT(11) NOT NULL COMMENT '商品id',
	`quantity` INT(11) NOT NULL COMMENT '商品数量'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8

#细节分类表
CREATE TABLE classification(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`name` VARCHAR(50) NOT NULL COMMENT '类型名字',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`aid` INT(11) NOT NULL COMMENT '母分类id'
)ENGINE=INNODB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为18 数据库默认编码为utf-8

#购物车表
CREATE TABLE goodscar(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`sid` INT(11) NOT NULL COMMENT '商品id',
	`uid` INT(11) NOT NULL COMMENT '用户id',
	`quantity` INT(11) NOT NULL COMMENT '商品数量',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '商品是否被删除'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8

#商品订单表
CREATE TABLE goodsoforderform(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`ofid` INT(11) NOT NULL,
	`sid` INT(11) NOT NULL COMMENT '商品id',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`quantity` INT(11) NOT NULL COMMENT '商品数量',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '商品是否被删除'
)ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为5 数据库默认编码为utf-8

#生成订单表
CREATE TABLE orderform(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '商品是否被删除',
	`uid` INT(11) NOT NULL COMMENT '用户id',
	`address` VARCHAR(255) NOT NULL COMMENT '地址',
	`context` VARCHAR(255) DEFAULT NULL COMMENT '备注'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8

#处理订单表
CREATE TABLE shopcar(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '商品是否被删除',
	`uid` INT(11) NOT NULL COMMENT '用户id'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8

#订单备注表
CREATE TABLE shopcontext(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`sid` INT(11) NOT NULL COMMENT '商品id',
	`context` VARCHAR(255) DEFAULT NULL COMMENT '备注',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '商品是否被删除',
	`uid` INT(11) NOT NULL COMMENT '用户id'
)ENGINE=INNODB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为15 数据库默认编码为utf-8

#商品信息表
CREATE TABLE shopinformation(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`name` VARCHAR(50) NOT NULL COMMENT '商品名称',
	`level` INT(11) NOT NULL COMMENT '商品成色',
	`remark` VARCHAR(255) NOT NULL COMMENT ' 商品详细信息',
	`price` DECIMAL(10,2) NOT NULL COMMENT '商品价格',
	`sort` INT(11) NOT NULL COMMENT '商品类别',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '商品是否被下架',
	`quantity` INT(11) NOT NULL COMMENT '商品数量',
	`transaction` INT(11) NOT NULL DEFAULT '1' COMMENT '交易方式',
	`sales` INT(11) DEFAULT '0' COMMENT '商品销量',
	`uid` INT(11) NOT NULL COMMENT '发表的用户id',
	`image` VARCHAR(255) DEFAULT NULL COMMENT '商品的图片地址',
	`thumbnails` VARCHAR(255) DEFAULT NULL COMMENT '缩略图',
	KEY `index_uid` (`uid`) USING BTREE#使用二叉树模式
)ENGINE=INNODB AUTO_INCREMENT=1098 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为1098 数据库默认编码为utf-8

#商品图片表
CREATE TABLE shoppicture(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`sid` INT(11) NOT NULL COMMENT '商品id',
	`picture` VARCHAR(200) NOT NULL COMMENT '图片路径',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '商品是否被删除'
)ENGINE=INNODB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为89 数据库默认编码为utf-8

#商品类型表
CREATE TABLE specifickinds(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`name` VARCHAR(50) NOT NULL COMMENT '类型名称',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`cid` INT(11) NOT NULL
)ENGINE=INNODB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为95 数据库默认编码为utf-8


#我的收藏表
CREATE TABLE usercollection(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`uid` INT(11) NOT NULL COMMENT '评论的用户id',
	`sid` INT(11) NOT NULL COMMENT '商品的id',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '是否可见'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8


#用户信息表
CREATE TABLE userinformation(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`username` VARCHAR(50) NOT NULL COMMENT '用户昵称',
	`phone` CHAR(11) NOT NULL COMMENT '用户手机号码',
	`realname` VARCHAR(50) DEFAULT NULL COMMENT '用户真实姓名',
	`clazz` VARCHAR(50) DEFAULT NULL COMMENT '用户所在班级',
	`sno` CHAR(12) DEFAULT NULL COMMENT '用户学号',
	`dormitory` VARCHAR(50) DEFAULT NULL COMMENT '宿舍号',
	`gender` CHAR(2) DEFAULT NULL COMMENT '性别',
	`createtime` DATETIME DEFAULT NULL COMMENT '创建时间',
	`avatar` VARCHAR(200) DEFAULT NULL COMMENT '头像',
	UNIQUE KEY `index_id` (`id`) USING BTREE,#使用二叉树模式
	KEY `selectByPhone` (`phone`)
)ENGINE=INNODB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为10 数据库默认编码为utf-8


#用户密码表
CREATE TABLE userpassword(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`password` VARCHAR(24) NOT NULL COMMENT '用户密码',
	`uid` INT(11) NOT NULL COMMENT '用户id'
)ENGINE=INNODB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为10 数据库默认编码为utf-8


#用户发布表
CREATE TABLE userrelease(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '是否存在',
	`uid` INT(11) NOT NULL COMMENT '用户id',
	`sid` INT(11) NOT NULL COMMENT '商品id'
)ENGINE=INNODB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为1006 数据库默认编码为utf-8

#用户状态表
CREATE TABLE userstate(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`credit` INT(11) NOT NULL DEFAULT '80' COMMENT '信用',
	`balance` DECIMAL(10,2) NOT NULL DEFAULT '0.00' COMMENT '平衡',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`uid` INT(11) NOT NULL COMMENT '用户id'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8

#求购商品表
CREATE TABLE userwant(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '信息是否被删除',
	`name` VARCHAR(50) NOT NULL COMMENT '求购商品名称',
	`sort` INT(100) NOT NULL COMMENT '求购商品类别',
	`quantity` INT(11) NOT NULL COMMENT '数量',
	`price` DECIMAL(10,2) NOT NULL COMMENT '求购商品价格',
	`remark` VARCHAR(255) DEFAULT NULL COMMENT '求购商品详情',
	`uid` INT(11) NOT NULL COMMENT '用户id'
)ENGINE=INNODB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;#使用innodb引擎 自增键的起始序号为13 数据库默认编码为utf-8

#求购商品备注表
CREATE TABLE wantcontext(
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	`modified` DATETIME DEFAULT NULL COMMENT '修改时间',
	`uwid` INT(11) NOT NULL,
	`context` VARCHAR(255) NOT NULL COMMENT '备注',
	`display` INT(11) NOT NULL DEFAULT '1' COMMENT '信息是否被删除'
)ENGINE=INNODB DEFAULT CHARSET=utf8;#使用innodb引擎 数据库默认编码为utf-8
