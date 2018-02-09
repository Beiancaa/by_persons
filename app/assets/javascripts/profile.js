$(document).on('turbolinks:load', function() {
  $('.person_check').change(function() {
    $.ajax({
      url: '/profiles/change_person_status?id=' + this.id,
      type: 'post'
    });
  });
});