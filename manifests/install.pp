class reviewboard::install($git = true, $mercurial = true, $subversion = true,
                           $git_package = 'git-core', $mercurial_package = 'mercurial', 
                           $subversion_package = 'subversion', $subversion_python_binding_package = 'python-svn',
                           $pylucene_package = 'pylucene') {

   if !defined(Package['python-dev']) {
      package { 'python-dev':
         ensure => 'installed',
      }
   }

   if !defined(Package['patch']) {
      package { 'patch':
         ensure => 'installed',
      }
   }

   if ($git == true) {
     if !defined(Package["$git_package"]) {
         package { "$git_package":
            ensure => 'installed',
         }
      }
   }

   if ($mercurial == true) {
     if !defined(Package["$mercurial_package"]) {
         package { "$mercurial_package":
            ensure => 'installed',
         }
      }
   }

   if ($subversion == true) {
     if !defined(Package["$subversion_package"]) {
         package { "$subversion_package":
            ensure => 'installed',
         }
      }

     if !defined(Package["$subversion_python_binding_package"]) {
         package { "$subversion_python_binding_package":
            ensure => 'installed',
         }
      }
   }

   if !defined(Package['memcached']) {
      package { 'memcached':
         ensure => 'installed',
      }
   }

   easyinstall::module { 'python-memcached': }
   easyinstall::module { 'ReviewBoard': }
   easyinstall::module { 'RBTools': }

}
