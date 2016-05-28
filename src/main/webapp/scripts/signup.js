$(document).ready(function() {
$('#submitbutton').click(function(event) {       

	//Get the data from all the fields
    var username = $("#username").val();
    var password = $("#password").val();
    var firstname = $("#firstname").val();
    var lastname = $("#lastname").val();
    var email = $("#email").val();

    /*$.post('http://localhost:8075/signup', { 	username: "username.val()", 
    											password: "password.val()", 
    											firstname: "firstname.val()",
    											lastname: "lastname.val()",
    											email: "email.val()"}, 
    											function () {
            $('.success_msg').append("Signup successful").fadeIn();
        });
        event.preventDefault();
    }); */
    
    
    var request = {
    		 method: 'POST',
    		 url: 'http://localhost:8075/login',
    		 headers: {
    		   'Content-Type': undefined
    		 },
    		 data: { username: username, 
    				password: password,firstname:firstname,lastname:lastname,email:email }
    		}
    
    $http(request).then(function(response, status, headers, config){
    	alert("Success");
    	
    }, function(response, status, headers, config){
    	alert("failure");
    });
    event.preventDefault();

});
});