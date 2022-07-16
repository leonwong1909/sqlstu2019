 -- 创建数据库
 create database db_name;

 -- 删除数据库，if exists强制删除
 drop database [if exists] db_name;

 -- 创建数据表
 -- unsigned 非负数，只有存在int类型中
 -- unique 唯一
 -- not null 不为空
 -- auto_increment 自动增长
 -- primary key 表示为主键
 -- default 默认值
 create table tbl_name (
    id int not null unique auto_increment primary key,
    --字段 类型 约束(空否，主键或唯一键,默认值，自动增长),
    foreign key (xx_id)
    --外键
 );

 -- 修改表结构
    -- 0. 查看表结构
        desc tbl_name;
    -- 1. 修改表名称
        rename table tbl_name to new_tbl_name;
    -- 2. 删除主键
        alter table tbl_name drop primary key;
    -- 3. 修改某个字段
        alter table laptop2018 change l_time make_time date;
        --修改前
        +---------+--------------------------+------+-----+---------+----------------+
        | Field   | Type                     | Null | Key | Default | Extra          |
        +---------+--------------------------+------+-----+---------+----------------+
        | l_id    | int(10) unsigned         | NO   | PRI | NULL    | auto_increment |
        | l_brand | varchar(10)              | NO   |     | 未知    |                |
        | l_model | varchar(20)              | NO   |     | NULL    |                |
        | l_size  | enum('13.3','14','15.6') | YES  |     | NULL    |                |
        | l_price | decimal(7,2)             | YES  |     | NULL    |                |
        | l_time  | date                     | YES  |     | NULL    |                |
        +---------+--------------------------+------+-----+---------+----------------+
        --修改后
        +-----------+--------------------------+------+-----+---------+----------------+
        | Field     | Type                     | Null | Key | Default | Extra          |
        +-----------+--------------------------+------+-----+---------+----------------+
        | l_id      | int(10) unsigned         | NO   | PRI | NULL    | auto_increment |
        | l_brand   | varchar(10)              | NO   |     | 未知    |                |
        | l_model   | varchar(20)              | NO   |     | NULL    |                |
        | l_size    | enum('13.3','14','15.6') | YES  |     | NULL    |                |
        | l_price   | decimal(7,2)             | YES  |     | NULL    |                |
        | make_time | date                     | YES  |     | NULL    |                |
        +-----------+--------------------------+------+-----+---------+----------------+
        --修改'未知'
        alter table laptop2018 change l_brand l_brand varchar(10);
        --修改后
        +-----------+--------------------------+------+-----+---------+----------------+
        | Field     | Type                     | Null | Key | Default | Extra          |
        +-----------+--------------------------+------+-----+---------+----------------+
        | l_id      | int(10) unsigned         | NO   | PRI | NULL    | auto_increment |
        | l_brand   | varchar(10)              | YES  |     | NULL    |                |
        | l_model   | varchar(20)              | NO   |     | NULL    |                |
        | l_size    | enum('13.3','14','15.6') | YES  |     | NULL    |                |
        | l_price   | decimal(7,2)             | YES  |     | NULL    |                |
        | make_time | date                     | YES  |     | NULL    |                |
        +-----------+--------------------------+------+-----+---------+----------------+
        -- 上面使用的是change修改，无论是否要修改字段还是类型都要写新旧字段，如果仅仅要修改类型可
        -- 以使用 'modify'
        -- 将l_model改为唯一
        alter table laptop2018 modify l_model varchar(30) unique not null;
        +-----------+--------------------------+------+-----+---------+----------------+
        | Field     | Type                     | Null | Key | Default | Extra          |
        +-----------+--------------------------+------+-----+---------+----------------+
        | l_id      | int(10) unsigned         | NO   | PRI | NULL    | auto_increment |
        | l_brand   | varchar(10)              | YES  |     | NULL    |                |
        | l_model   | varchar(30)              | NO   | UNI | NULL    |                |
        | l_size    | enum('13.3','14','15.6') | YES  |     | NULL    |                |
        | l_price   | decimal(7,2)             | YES  |     | NULL    |                |
        | make_time | date                     | YES  |     | NULL    |                |
        +-----------+--------------------------+------+-----+---------+----------------+
        -- 总结change和modify没有多大的差别，只改字段可以用change，要改类型或约束用modify，两种都要带上type
    -- 添加字段
    alter table tbl_name add Field Type ...;
    -- 删除字段
    alter table tbl_name drop COLUMN Field;
 -- 删除表
 drop table tbl_name1,tbl_name2;

 -- 插入数据
 INSERT INTO tbl_name (col1,col2) VALUES(15,col1*2); -- 前面括号是字段，后面括号对应前面字段的数值
 insert into <表名> value
 （<数据D>，<数据G>，<数据I>),
 （<数据D>，<数据G>，<数据I>),
 （<数据D>，<数据G>，<数据I>);  -- 可以不用前面的括号，但每一条数值都要填写

 -- 修改表数据
 update tbl_name set 字段1=数据1, 字段2=数据2 WHERE ....; -- 后面接上修改的条件
    -- 修改前
    +------+---------+-------------------+--------+----------+------------+
    | l_id | l_brand | l_model           | l_size | l_price  | make_time  |
    +------+---------+-------------------+--------+----------+------------+
    |    1 | 苹果    | MacBook pro(2019) | 15.6   | 21000.30 | 2019-04-01 |
    |    5 | 微软    | surface book2     | 14     | 22530.33 | 2018-07-01 |
    |    6 | 惠普    | ENVY 13           | 13.3   |  6700.99 | 2019-04-03 |
    |    7 | 戴尔    | xps 13            | 13.3   | 12300.40 | 2019-06-01 |
    |    8 | 联想    | xiaoxing 5        | 15.6   |  5300.40 | 2019-03-01 |
    +------+---------+-------------------+--------+----------+------------+
    update laptop2018 set l_id = 2 where l_id = 5;
 -- 删除数据
 DELETE FROM <表名> WHERE <字段> IN (2,3,4);  -- 删除字段为1，2，3的数据

 -- 重置表数据，重置自动增长
 truncate table <表名>;
 -- 重新设置自动增长从1开始
 ALTER TABLE tbl_name auto_increment = 1;




