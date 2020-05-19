$('document').ready(function(){
  $(document).on('ajax:complete', '#index', function(event, data, status, xhr) {
    alert("I am ready");

    // response will come underneath of ‘data’ variable
    //var response = data.random_param_name;
    alert(“Response is => ” + response)
  });  
});