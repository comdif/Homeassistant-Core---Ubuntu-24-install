**The HA team no longer supports Core, but you can continue to install and use it.**

Here's how to install it on a Raspberry Pi 4 using Ubuntu 24.04 LTS.

Everything is done as root; if you are working as a user, type sudo -i at startup or create a root password to work as root.

I'm also installing everything necessary to migrate the SQLite database to MySQL because I find HA much faster with MySQL.

However, this isn't the focus of this tutorial, and I won't be covering that topic.
<ins>_____________________________________________________________________________________</ins>

**Add repository**

>add-apt-repository ppa:deadsnakes/ppa

**Install all these packages:**

> apt install -y python3.13 python3.13-dev python3.13-venv python3-pip build-essential libffi-dev libssl-dev libjpeg-dev zlib1g-dev bluez
> 
> apt install -y libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev libxml2-dev libxmlsec1-dev libxslt1-dev
> 
> apt install -y liblzma-dev libudev-dev avahi-daemon libavahi-client-dev dbus systemd libglib2.0-dev libc6-dev libbluetooth-dev
> 
> apt install -y libreadline-dev python-docutils libical-dev libsystemd-dev tk-dev libgdbm-dev pkg-config default-libmysqlclient-dev

############## Fix Bluetooth

> cd /usr/src
  
> wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.85.tar.gz
  
> tar -xzf bluez-5.85.tar.gz
  
> cd bluez-5.85
  
> ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc --localstatedir=/var
  
> make
  
############## if there is no errors uninstall old bluez

> apt-get purge bluez
> make install
> systemctl daemon-reload && systemctl restart dbus bluetooth

############## Check status

> systemctl status bluetooth.service
> 
############## Fix Bluetooth error messages NET_ADMIN/NET_RAW capabilities

> setcap 'cap_net_admin,cap_net_raw+eip' /usr/bin/python3.13

> useradd -rm homeassistant -G dialout

>  mkdir /srv/homeassistant

> chown homeassistant:homeassistant /srv/homeassistant

> sudo -u homeassistant -H -s

#################### YOU ARE NOW homeassistant USER #############################

> cd /srv/homeassistant

> python3.13 -m venv /srv/homeassistant

> source bin/activate

> python3.13 -m pip install wheel

> pip3 install homeassistant==2025.12.3

> pip3 install --upgrade "pycares==4.9.0"

> pip3 install mysqlclient

> hass -v

**###### Wait 1 or 2 houres :-) and when you are tired to wait you can hit Ctrl-C**

Now create the startup script /etc/init.d/homeassistant" with nano or any other tool of your choice or get it by this way:

> cd /ect/init.d

> wget https://raw.githubusercontent.com/comdif/Homeassistant-Core---Ubuntu-24-install/refs/heads/main/homeassistant

> chmod 0755 /etc/init.d/homeassistant

> update-rc.d homeassistant defaults

##############################################
Now type:

> chmod 0755 /etc/init.d/homeassistant

> update-rc.d homeassistant defaults

> reboot

**Once finished you will be able to go to http://your_ip:8123 and enjoy the latest version of home-assistant on an up-to-date OS.**

