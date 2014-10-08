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
Файл `sql.conf` скопіювати в `/etc/proftpd/sql.conf` і на місцях `MYSQL_*` вставити правильні значення доступу до БД.
### Встановити s7ctl, налаштувати.
В файлі s7ctl потрібно на місцях `MYSQL_*` вставити правильні значення для доступу до БД.
### Встановити nginx як вебсервер, налаштувати хост для хостингу статики.
