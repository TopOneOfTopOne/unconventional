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
  $('.embedly').embedly({
    key: '7918a7b91ef74f3790e4e9d15e0f7aa2'
  });

  $('.embedlink').on('keyup', function(){
    console.log("keyup");
    var message = $('<span class="insert">Type in the URL of the site you would like to embed an image from.</span>');
    if($('#post_embedlink').val().length > 0){
      console.log($('#post_embedlink').val().length > 0);
      $('#post_picture').hide();
      $('.message').html(message)
    } else {
      $('#post_picture').show();
      $('.insert').remove()
    }
  });

  $('.picture').on('change', function(){
    console.log($('#post_picture'));
    var message = $('<span class="insert">This image will be uploaded to your gallery.</span>');
    if($('#post_picture').val()){
      console.log($('#post_picture'));
      $('#post_embedlink').prop('disabled', true);
      $(this).append(message)
    } else {
      $('#post_embedlink').prop('disabled', false);
      $('.insert').remove()
    }
  });
});
