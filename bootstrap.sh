#PHPンストール
sudo yum -y update
sudo yum -y install epel-release
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum -y install php71 php71-php-fpm php71-php-mysqlnd php71-php-opcache php71-php-xml php71-php-xmlrpc php71-php-gd php71-php-mbstring php71-php-json
sudo ln -s /usr/bin/php71 /usr/bin/php
sudo mkdir -p /var/www/html
sudo ln -fs /vagrant/web /var/www/html

#vimのインストール
sudo yum -y install vim

#composerのインストール
cd /vagrant
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
#cp .bash_profile ~/
#source ~/.bash_profile

#selinux無効
#sudo cp /vagrant/config /etc/selinux

#nginxインストール
#sudo cp /vagrant/nginx.repo /etc/yum.repos.d
sudo yum -y install nginx
#sudo cp /vagrant/www.conf /etc/php-fpm.d/
#sudo cp /vagrant/default.conf /etc/nginx/conf.d/
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl start php71-php-fpm
sudo systemctl enable php71-php-fpm
#systemctl restart php-fpm
#sudo chmod 666 /var/run/php-fpm/php-fpm.sock
#firewall-cmd --add-port=開けたいポート番号/tcp --zone=public --permanent
#firewall-cmd --reload //反映

#zip unzip gitインストール
sudo yum -y install zip unzip git

#設定ファイルの更新
#sudo cp /vagrant/www.conf /etc/opt/remi/php71/php-fpm.d/
#sudo cp /vagrant/nginx.conf /etc/nginx/