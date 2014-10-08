static-hosting
==============

# Steps
1. Домен *.static.domain.com вказує на сервери(-и).
Приклад:
```
static.domain.com IN A 1.2.3.4
*.static.domain.com IN CNAME static.domain.com.
```
2. Встановити proftpd з підтримкою mysql:
```bash
sudo apt-get install proftpd-basic proftpd-mod-mysql
```
3. Встановити сервер БД і створити там таблички (static.sql), юзера або використати сервіс що дає БД, наприклад cleardb.
4. Сконфігурити proftpd, щоб використовував mysql.
5. Встановити s7ctl, налаштувати.
6. Встановити nginx як вебсервер, налаштувати хост для хостингу статики.
