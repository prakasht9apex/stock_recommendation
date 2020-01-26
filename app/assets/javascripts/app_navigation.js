$(document).ready(function () {
  // when opening the sidebar
  $('.sidebarCollapse').on('click', function () {
    var sidebarArea = $(this).data('sidebar-id');
    // open sidebar
    $('#'+sidebarArea).addClass('active');

    // fade in the overlay
    $('.overlay').fadeIn();

    // close dropdowns
    $('.collapse.in').toggleClass('in');

    // and also adjust aria-expanded attributes we use for
    // the open/closed arrows in our CSS
    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
  });


  // if dismiss or overlay was clicked
  $('#dismiss, .overlay').on('click', function () {
    // hide the sidebar
    $('.app_sidebar').removeClass('active');
    // fade out the overlay
    $('.overlay').fadeOut();
  });

  $(".static_sidebar a[data-toggle='collapse']").on('click', function(){
    var $activeNav = $(this).closest('.static_sidebar').find('a[aria-expanded="true"]');

    if($(this)[0] != $activeNav[0]) {
      $activeNav.attr('aria-expanded', 'false');
      $activeNav.addClass('collapsed');
      $(this).closest('.static_sidebar').find('.collapse.show').removeClass('show');
    }
  });

  $('.staticSidebarCollapse').on('click', function () {
    // open or close navbar
    $('.static_sidebar').toggleClass('inactive');

    // set main content area active or inactive
    $('#content').toggleClass('active');

    // close dropdowns
    $('.collapse.in').toggleClass('in');

    // and also adjust aria-expanded attributes
    // we use for the open/closed arrows in our CSS
    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
  });

});

