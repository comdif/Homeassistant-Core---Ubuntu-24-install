***Migration from sqlite to Mysql***

Run ssh session as root or with sudo-i

If you have not done it before install Mysql package 

>apt install -y mysql-server mysql-client

>service homeassistant stop

Now create the user and the database (use 'user'@'%' if you need remote mysql access )

> mysql -u root -e ""CREATE DATABASE homeassistant CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"

> mysql -u root -e "CREATE USER 'haDBadministrat0rlogin'@'localhost' IDENTIFIED BY 'haDBadministrat0rpassword';"

> mysql -u root -e "GRANT ALL ON homeassistant.* TO 'haDBadministrat0r'@'localhost';"

> mysql -u root -e "FLUSH PRIVILEGES;"

> cd /srv/homeassistant

> source bin/activate

> pip install sqlite3-to-mysql

> sqlite3mysql -f /home/homeassistant/.homeassistant/home-assistant_v2.db -d homeassistant -u haDBadministrat0rlogin -p -h 127.0.0.1 -P 3306 -W

enter your haDBadministrat0rpassword and wait until the operation is done.
Now you have to fix the auto-increment counter
if it's a fresh homeassistant installation:

>wget https://raw.githubusercontent.com/comdif/Homeassistant-Core---Ubuntu-24-install/refs/heads/main/fix-new.sql

>mysql -h localhost -u root homeassistant < fix-new.sql

other cases:

>wget https://raw.githubusercontent.com/comdif/Homeassistant-Core---Ubuntu-24-install/refs/heads/main/fix.sql

>mysql -h localhost -u root homeassistant < fix.sql
 
Now edit the /home/homeassistant/.homeassistant/configuration.yaml file and add theses lines at the end:

>recorder:

  >> purge_keep_days: 5
  
  >> db_url: mysql://haDBadministrat0rlogin:haDBadministrat0rpassword@localhost/homeassistant?charset=utf8mb4

All lines after recorder: must be indented with 2 blank spaces


