$(document).on('turbolinks:load', function () {
  $('.top-posts').on('change', function () {
    console.log(this.value);
  })
})
