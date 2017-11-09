document.addEventListener('turbolinks:load', function() {
  var $showPassword = $('#show_password');

  $showPassword.on('click', function() {
    $inputPassword = $('#user_password_trainline').prop('type');

    if ($inputPassword === 'text') {
      $showPassword.text('Voir')
      $('#user_password_trainline').prop('type', 'password');
    } else {
      $showPassword.text('Cacher')
      $('#user_password_trainline').prop('type', 'text');
    }
  });
});
