$(document).on('turbolinks:load', function () {
  $('#choice').on('change', function () {
    $(this).parents('form').submit();
  })
})
