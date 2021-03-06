### dense_rank() 窗口函数
 是一个窗口函数，把结果的每一行分配排名，排名值没有间隙，且每级+1
 ```mysql
 DENSE_RANK() OVER (
    PARTITION BY <expression>[{,<expression>...}]
    ORDER BY <expression> [ASC|DESC], [{,<expression>...}]
)
```
[参考链接](http://www.mysqltutorial.org/mysql-window-functions/mysql-dense_rank-function/)

```mysql
+----------------+-------------+--------+
| sales_employee | fiscal_year | sale   |
+----------------+-------------+--------+
| Alice          |        2016 | 150.00 |
| Alice          |        2017 | 100.00 |
| Alice          |        2018 | 200.00 |
| Bob            |        2016 | 100.00 |
| Bob            |        2017 | 150.00 |
| Bob            |        2018 | 200.00 |
| John           |        2016 | 200.00 |
| John           |        2017 | 150.00 |
| John           |        2018 | 250.00 |
+----------------+-------------+--------+
```
**order by <*exp*> 根据某字段对表数据前后排序rank，例如:根据时间或者根据金钱**
```mysql
order by fiscal_year:
+----------------+-------------+--------+------+
| sales_employee | fiscal_year | sale   | rank |
+----------------+-------------+--------+------+
| Alice          |        2018 | 200.00 |    1 |
| Bob            |        2018 | 200.00 |    1 |
| John           |        2018 | 250.00 |    1 |
| Alice          |        2017 | 100.00 |    2 |
| Bob            |        2017 | 150.00 |    2 |
| John           |        2017 | 150.00 |    2 |
| Alice          |        2016 | 150.00 |    3 |
| Bob            |        2016 | 100.00 |    3 |
| John           |        2016 | 200.00 |    3 |
+----------------+-------------+--------+------+
order by sale:
+----------------+-------------+--------+------+
| sales_employee | fiscal_year | sale   | rank |
+----------------+-------------+--------+------+
| John           |        2018 | 250.00 |    1 |
| Alice          |        2018 | 200.00 |    2 |
| Bob            |        2018 | 200.00 |    2 |
| John           |        2016 | 200.00 |    2 |
| Alice          |        2016 | 150.00 |    3 |
| Bob            |        2017 | 150.00 |    3 |
| John           |        2017 | 150.00 |    3 |
| Alice          |        2017 | 100.00 |    4 |
| Bob            |        2016 | 100.00 |    4 |
+----------------+-------------+--------+------+
```
**partition by <*exp*> 根据某字段对表数据分组排序rank，优先于order by**
```mysql
partition by sales_employee:
+----------------+-------------+--------+------+
| sales_employee | fiscal_year | sale   | rank |
+----------------+-------------+--------+------+
| Alice          |        2016 | 150.00 |    1 |
| Alice          |        2017 | 100.00 |    2 |
| Alice          |        2018 | 200.00 |    3 |
| Bob            |        2016 | 100.00 |    1 |
| Bob            |        2017 | 150.00 |    2 |
| Bob            |        2018 | 200.00 |    3 |
| John           |        2016 | 200.00 |    1 |
| John           |        2017 | 150.00 |    2 |
| John           |        2018 | 250.00 |    3 |
+----------------+-------------+--------+------+
partiton by fiscal_year:
+----------------+-------------+--------+------+
| sales_employee | fiscal_year | sale   | rank |
+----------------+-------------+--------+------+
| Bob            |        2016 | 100.00 |    1 |
| Alice          |        2016 | 150.00 |    2 |
| John           |        2016 | 200.00 |    3 |
| Alice          |        2017 | 100.00 |    1 |
| Bob            |        2017 | 150.00 |    2 |
| John           |        2017 | 150.00 |    2 |
| Alice          |        2018 | 200.00 |    1 |
| Bob            |        2018 | 200.00 |    1 |
| John           |        2018 | 250.00 |    2 |
+----------------+-------------+--------+------+
partion by sale:
+----------------+-------------+--------+------+
| sales_employee | fiscal_year | sale   | rank |
+----------------+-------------+--------+------+
| Bob            |        2016 | 100.00 |    1 |
| Alice          |        2017 | 100.00 |    2 |
| Alice          |        2016 | 150.00 |    1 |
| Bob            |        2017 | 150.00 |    2 |
| John           |        2017 | 150.00 |    2 |
| John           |        2016 | 200.00 |    1 |
| Alice          |        2018 | 200.00 |    2 |
| Bob            |        2018 | 200.00 |    2 |
| John           |        2018 | 250.00 |    1 |
+----------------+-------------+--------+------+
```
**`partion by`和`order by`不能是同一个字段**