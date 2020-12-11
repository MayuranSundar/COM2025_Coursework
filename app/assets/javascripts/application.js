// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery.validate
//= require activestorage
//= require turbolinks
//= require_tree .

function  ValidateContact_form()
{
    $('#ContactForm').validate({
      rules: {
        name: {required: true},
        message: {required: true},
        phone: {
          required: true,
          digits: true,
          maxlength: 11,
          minlength: 11,
        },
        email: {
          required: true,
          email: true,
        }
      },
      messages: {
        name: {required: "You must have a name right?",},
        message: {required: "We are sure you don't want to send us an empty message",},
        phone: {
          required: "We need your phone number as well",
          digits: "Phone numbers only have digits",
          minlength: "UK numbers have 11 digits, include 0",
          maxlength: "UK numbers have 11 digits, include 0",
        },
        email: {
          required: "How are we going to get back to you without an email?",
          email: "That doesn't look like a valid email",
        }
      }
    });
}

function  ValidateOrders_form()
{
    $('#orders_form').validate({
      rules: {
        name: {required: true},
        address: {required: true},
        email: {
          required: true,
          email: true,
        },
        paytype: {required: true},
      },
      messages: {
        name: {required: "Who are we going to the order to?",},
        address: {required: "If you want your phone, we need your address",},
        email: {
          required: "We need your email to keep you updated",
          email: "That doesn't look like a valid email",
        },
        paytype: {required: "Select how you would like to pay us",},
        
      }
    });
}

$(document).ready(function() {

    if(document.getElementById('ContactForm'))
    {
      ValidateContact_form();
    }

    if(document.getElementById('orders_form'))
    {
      ValidateOrders_form();
    }


});
  