import $ from 'jquery';
window.jQuery = $;
window.$ = $;
import Vue from 'vue'
import App from '../app.vue'

//убрать js и добавлять отправку в форме
$('document').ready(function(){
  $('.js-mark-done').on('click', function(event) {
    console.log($(this))
    console.log(event)
    var bool = this.checked ? 1 : 0;

    $.ajax({
      url: '/elements/'+this.id+'/check',
      type: "put",
      data: '{"id":"'+ this.id +'", "bool":"'+ bool +'"}'
    })
  });



});


  
document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))
  console.log(app)

  const app = new Vue({
    el,
    render: h => h(App)
  })
})
