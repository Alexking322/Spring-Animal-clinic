$(document).ready(function () {

    $("#register_form").validate({

        rules: {

            login: {
                required: true,
                minlength: 4,
                maxlength: 24,
            },

            email: {
                required: true,
            },

            password: {
                required: true,
                minlength: 6,
                maxlength: 32,
            },

        },

    });

});
