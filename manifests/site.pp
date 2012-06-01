define reviewboard::site($install_parent_path = "/var/www", $admin_user = "admin", $admin_password = "admin", $admin_email) {

   include apache2
   include apache2_wsgi
   include reviewboard   

   $sitename = "$name"
   exec { "create-site-$sitename":
      command => "rb-site install $install_parent_path/$sitename --noinput --domain-name='$sitename' --db-type='sqlite3' --cache-type='memcached' --web-server-type='apache' --python-loader=='wsgi' --admin-user='$admin_user' --admin-password='$admin_password' --admin-email='$admin_email'",
      user => "$apache2::apache2_user",
      creates => "$install_parent_path/$sitename"
   }

   $virtualhost_name = "$name"
   apache2::virtualhost { "$virtualhost_name":
        virtualhost_name => "$virtualhost_name",
        server_admin_mail => "$admin_mail",
        document_root => "$install_parent_path/$sitename/htdocs",
        virtualhost_specifics => template("reviewboard/reviewboard_virtual_host_specifics.erb"),
        is_https => false,
#        ssl_cert => "$ssl_cert",
#        ssl_cert_key => "$ssl_cert_key",
    }

}
