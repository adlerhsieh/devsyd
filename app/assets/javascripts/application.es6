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
//= require rails-ujs
//= require_tree .

var square = (n) => n * n

$(document).ready(() => {
  var darkBorder = () => {
    $(".edit-btn").css("border", "1px solid black");
  }
  $(".edit-btn").bind("hover", darkBorder);
  $(".edit-btn").click(() => {
    $(".edit-btn").hide();
    $(".editor-container").removeClass("hidden");
    quill.focus();
  })

  $(".editor-save").click(() => {
    quill.enable(false);
    $(".editor-save-text").hide();
    $("img.loading").removeClass("hidden");
    $(".edit-btn").unbind("hover", darkBorder);
  })

})

