//= require jquery
//= require jquery3
//= require jquery_ujs
//= require jquery-ui
//= require popper
//= require bootstrap
//= require app_navigation
//= require selectize
//= require cable
$(document).ajaxError(function (e, xhr, settings) {
  if (xhr.status == 401) {
    location.reload()
  }
});