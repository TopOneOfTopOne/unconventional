// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require turbolinks
//= require_tree .
//= require bootstrap

$(document).ready(function(){
  $('p a').embedly({
    key: '7918a7b91ef74f3790e4e9d15e0f7aa2'
  });

  $('.description').on('keyup', function(){
    console.log("keyup");
    var message = $('<span>Type in the URL of the site you would like to embed an image from.</span>');
    if($('#post_description').val().length > 0){
      console.log($('#post_description').val().length > 0);
      $('#post_picture').hide();
      $('.message').html(message)
    } else {
      $('#post_picture').show();
    }
  });

  $('.picture').on('change', function(){
    console.log($('#post_picture').value);
    var message = $('<span>This image will be uploaded to your gallery.</span>');
    if($('#post_picture').value === true ){
      console.log($('#post_picture').name);
      $('#post_description').disabled = true;
      $(this).append(message)
    } else {
      $('#post_picture').disabled = false;
    }
  });
});
