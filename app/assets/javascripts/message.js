$( document ).ready(function() {
    $("#new_message").bind("ajax:complete", function(event,xhr,status){
        $('#message_content').val('');
    })
});