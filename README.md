puppet-reviewboard
==================

Module to install reviewboard and sites for it. Depends on:
  * puppet-easyinstall: https://github.com/osoco/puppet-easyinstall 
  * puppet-apache2: https://github.com/osoco/puppet-apache2
Example:

   class my_review_board_class {
      reviewboard::site { 'reviewboard.myorg.com': admin_email => 'admin@myorg.com' }
   }
