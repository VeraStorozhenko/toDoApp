import $ from 'jquery';
window.jQuery = $;
window.$ = $;

$('document').ready(function(){
  console.log('Hello from indexjs')

  $('.js-mark-done').on('click', function(event) {
    console.log('check box ready')
    console.log($(this))
    console.log(event)

    $.ajax({
      url: "/elements/9/check",
      type: "put",
      data: "true",
      success: function(data) {},
      error: function(data) {}
    })


  });

});
  
 
