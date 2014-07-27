// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require jquery.readyselector
//= require jquery.externalscript
//= require registrations
//= require ../../../vendor/assets/javascripts/jquery.flot/jquery.flot
//= require ../../../vendor/assets/javascripts/jquery.flot/jquery.flot.time
//= require ../../../vendor/assets/javascripts/jquery.flot/jquery.flot.categories
//= require ../../../vendor/assets/javascripts/jquery.flot/jquery.flot.tooltip
//= require ../../../vendor/assets/javascripts/messenger/messenger.min
//= require ../../../vendor/assets/javascripts/messenger/messenger-theme-flat
//= require ../../../vendor/assets/javascripts/moment.min
//= require_directory ../../../vendor/assets/javascripts/.
//= require_directory ./pages/.
//= require_directory ./vendor/.
//= require theme
//= require_tree

$('.dropdown-toggle').click(function(e) {
  e.preventDefault();
  setTimeout($.proxy(function() {
    if ('ontouchstart' in document.documentElement) {
      $(this).siblings('.dropdown-backdrop').off().remove();
    }
  }, this), 0);
});