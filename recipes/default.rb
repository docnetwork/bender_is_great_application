#
# Cookbook:: bender_is_great_application
# Recipe:: default
# Author:: That's you!
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

execute 'update_apt' do
  command 'apt-get update -y'
  action :run
end

execute 'create_bender_group' do
  command 'groupadd -f bender'
  action :run
end

execute 'create_and_add_bender_user_to_bender_group' do
  command 'useradd -m -d /home/bender -c "Default bending unit. Made in Mexico." bender -N && usermod -aG bender bender'
  action :run
end

execute 'install_apach2_package' do
  command 'apt-get install apache2 -y'
  action :run
end

execute 'start_and_enable_apache2_service' do
  command 'sudo systemctl start apache2 && sudo systemctl enable apache2'
end

execute 'create_html_directories' do
  command 'mkdir -p -m 0755 /var/www/html && chown bender:bender /var/www/html'
end

execute 'create_apache2_bender_config' do
  command 'echo "<VirtualHost 0.0.0.0:80>

    ServerAdmin webmaster@localhost
    ServerName localhost

    DocumentRoot /var/www/html

    <Directory /var/www/html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>" > /etc/apache2/bender_is_great.conf && chown bender:bender /etc/apache2/bender_is_great.conf && chmod 644 /etc/apache2/bender_is_great.conf'
end

execute 'restart_apache2_service' do
  command 'systemctl restart apache2'
end

execute 'create_apache2_ports_config' do
  command 'echo "# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 0.0.0.0:80

<IfModule ssl_module>
	Listen 443
</IfModule>

<IfModule mod_gnutls.c>
	Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet" > /etc/apache2/ports.conf && chown bender:bender /etc/apache2/ports.conf && chmod 644 /etc/apache2/ports.conf'
end

execute 'restart_apache2_service_again' do
  command 'systemctl restart apache2'
end

# Ignore this resource.  The file is massive and I would rather not have it take up
# the whole page.
cookbook_file "/etc/apache2/apache2.conf" do
  owner "bender"
  group "bender"
  mode "0644"
  source "apache2.conf"
end

execute 'restart_apache2_service_again_2' do
  command 'sudo systemctl restart apache2'
end

execute 'create_bender_is_great_index_file' do
  command 'echo "<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
  <title>Bite my shiny metal ass!</title>
</head>

<body>
  <h1>Bender is great!  Bender is great!</h1>
  <h3>"REMEMBER ME!"</h3>
  <img src="http://www.reactiongifs.us/wp-content/uploads/2016/04/remember_me_futurama.gif"></img>
  <p>This webpage was developed by AUTHOR using Chef.</p>
</body>

</html>" > /var/www/html/index.html && chown bender:bender /var/www/html/index.html && chmod 644 /var/www/html/index.html'
end

execute 'final_apache2_restart' do
  command 'sudo systemctl restart apache2'
end
