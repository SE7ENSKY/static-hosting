static-hosting
==============

## Кроки
### Домен *.static.domain.com вказує на налаштовуваний сервер(-и).
Приклад:
```
static.domain.com IN A 1.2.3.4
*.static.domain.com IN CNAME static.domain.com.
```
### Встановити proftpd з підтримкою mysql.
```bash
sudo apt-get install proftpd-basic proftpd-mod-mysql
```
### Встановити сервер БД і створити там таблички `static.sql`, юзера або використати сервіс що дає БД, наприклад cleardb.
### Сконфігурити proftpd, щоб використовував mysql.
1. Файл `sql.conf` скопіювати в `/etc/proftpd/sql.conf` і на місцях `MYSQL_*` вставити правильні значення доступу до БД.
2. В файлі `/etc/proftpd/modules.conf` мають бути такі стрічки:
```
LoadModule mod_sql.c
LoadModule mod_sql_mysql.c
```
3. В файлі `/etc/proftpd/proftpd.conf`:
```
DefaultRoot ~
RequireValidShell off
PassivePorts 49152 65534
AuthOrder mod_sql.c
Include /etc/proftpd/sql.conf
```
4. Перезапустити ФТП сервер: ```service proftpd restart```
### Встановити s7ctl, налаштувати.
В файлі s7ctl потрібно на місцях `MYSQL_*` вставити правильні значення для доступу до БД.
### Встановити nginx як вебсервер, налаштувати хост для хостингу статики.
