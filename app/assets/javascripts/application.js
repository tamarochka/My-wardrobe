// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function() {
  $(document).foundation();

  var topStyles = $(".top-styles").remove();
  var bottomStyles = $(".bottom-styles").remove();
  var shoeStyles = $(".shoe-styles").remove();

  $("#clothing_clothing_type").change(function(e) {
    $(".style-container").empty();
    var style = $("#clothing_clothing_type option:selected").text();

    if (style === "Bottom") {
      $(".style-container").append(bottomStyles);
    } else if (style === "Top") {
      $(".style-container").append(topStyles);
    } else if (style === "Shoes") {
      $(".style-container").append(shoeStyles);
    }
  });

  var shoeOptions = $(".shoe-options").remove();
  var shoes = $("#shoes").remove();

  $(".toggle-shoe-options").on("click", function() {
    if ($(".shoe-options").length == 0) {
      $(".shoe-options-container").append(shoeOptions);
      $(".shoe-container").append(shoes);
    } else {
      shoeOptions = $(".shoe-options");
      shoeOptions.remove();
    }
  });
});
