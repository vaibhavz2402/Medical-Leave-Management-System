$(document).ready(function () {
    $('#subm').click(function (e) {
       
        




        var email = $('#email').val();
        var pass = $('#pass').val();

        var email_regex = /^[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+.[a-zA-z0-9]{2,4}$/;


        if (!email.match(email_regex) || email.length == 0) {
            alert("* Please enter a valid email address *");
            $("#email").focus();
            return false;
        }


        else if (pass.length < 6) {
            alert("Password Length should be greater than 6 digits");
            return false;
        }

        else {
            {
                alert("Form Submitted successfully ");
                
            }


            return true;







        }
    });

}
);
