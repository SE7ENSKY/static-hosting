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
4. Пофіксити автоматичний перезапуск http://stackoverflow.com/questions/23666697/proftpd-killed-signal-15-error-how-to-fix-logrotate-restart-error
В файлі `/etc/init.d/proftpd`:
Шукаємо рядок
```
start-stop-daemon --stop --signal $SIGNAL --quiet --pidfile "$PIDFILE"
```
і замінюємо на:
```
start-stop-daemon --stop --signal $SIGNAL --retry 1 --quiet --pidfile "$PIDFILE"
```
5. Перезапустити ФТП сервер: ```service proftpd restart```

### Встановити s7ctl, налаштувати.
1. Встановити файл `s7ctl` в /sbin, дать коректні права:
```bash
chown root:root /sbin/s7ctl
chmod 700 /sbin/s7ctl
```
2. В файлі `/sbin/s7ctl` потрібно на місцях `MYSQL_*` вставити правильні значення для доступу до БД.

### Встановити nginx як вебсервер, налаштувати хост для хостингу статики.
1. Встановити nginx: `apt-get install nginx`
2. Встановити конфігурації для nginx `echo 'include /srv/_.static/nginx.conf;' > /etc/nginx/conf.d/_.static.conf`
3. Скопіювати `nginx.conf` в `/srv/_.static/nginx.conf`
4. Налаштувати server_name в `/srv/_.static/nginx.conf`
5. `service nginx restart`

для роботи має бути встановлений mysql
`apt-get install mysql-client-core-5.6`
