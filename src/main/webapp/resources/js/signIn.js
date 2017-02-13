$(document).ready(function () {

    $("#loginForm").validate({

        rules: {

            user_login: {
                required: true,
                minlength: 4,
                maxlength: 24,
            },

            user_password: {
                required: true,
                minlength: 6,
                maxlength: 32,
            },

        },

    });

});
