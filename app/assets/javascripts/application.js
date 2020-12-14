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

// Function to validate the contact form
function  ValidateContact_form()
{
    // finds the contact form based on the id and uses the validate method
    $('#ContactForm').validate({
      // rules for the contact form
      // Makes all the fields required
      rules: {
        name: {
          required: true,
          lettersonly: true,
        },
        message: {required: true},
        phone: {
          // Digits only in phone field and max and min length to replicate a UK phone
          required: true,
          digits: true,
          maxlength: 11,
          minlength: 11,
        },
        email: {
          required: true,
          // To ensure it is a valid email
          email: true,
        }
      },
      // Messages for each of the rules set
      messages: {
        name: {
          required: "You must have a name right?",
          lettersonly: "Names must only contain letters, unless you are Elon's son",
        },
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

// Function to validate the orders form
function  ValidateOrders_form()
{
    // finds the order form based on the id and uses the validate method
    $('#order_form').validate({
      // Rules for the order form
      // Makes all the fields required
      rules: {
        'order[name]': {required: true},
        'order[address]': {required: true},
        'order[email]': {
          required: true,
          // To ensure it is a valid email
          email: true,
        },
        'order[pay_type]': {required: true},
      },
      // Messages for each of the rules set
      messages: {
        'order[name]': {required: "You must have a name right?",},
        'order[address]': {required: "If you want your phone, we need your address",},
        'order[email]': {
          required: "We need your email to keep you updated",
          email: "That doesn't look like a valid email",
        },
        'order[pay_type]': {required: "Select how you would like to pay us",},
        
      },
        validClass: "valid_class"
    });
}

// When the documetn is ready the ValidateContactForm and ValidateOrderForm methods are run
$(document).ready(function() {

    if(document.getElementById('ContactForm'))
    {
      ValidateContact_form();
    }

    // Could not use jQuery validate on form_with but an attempt was made
    if(document.getElementById('order_form'))
    {
      ValidateOrders_form();
    }

});
  