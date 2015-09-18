# MySQL

## [Grants](https://dev.mysql.com/doc/refman/5.1/en/grant.html)

* [Privileges provided by MySQL](https://dev.mysql.com/doc/refman/5.1/en/privileges-provided.html)

* Show grants (access) for a user ([SO](http://stackoverflow.com/a/21744960/125246):
```sql
/* How you logged in */
select user();
/* How you actually connected */
select current_user();

show grants for henry;
+--------------------------------------------------------------------+
| Grants for henry@%                                                 |
+--------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'henry'@'%' IDENTIFIED BY PASSWORD <secret>  | 
| GRANT SELECT, INSERT, UPDATE, DELETE ON `henryee`.* TO 'henry'@'%' | 
| GRANT ALL PRIVILEGES ON `mysql`.`henryee` TO 'henry'@'%'           | 
+--------------------------------------------------------------------+
```

Grant access to a user (including for them to be able to grant similar access to others):
```sql
GRANT ALL PRIVILEGES ON *.* TO 'tm_dba'@'%' IDENTIFIED BY 'mysql_dba' with grant option;
```
