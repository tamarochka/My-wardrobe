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

$(function(){ $(document).foundation(); });


$(document).ready(function(){
  $("#clothing_clothing_type").change(function(){
    if($("#clothing_clothing_type").val() === "Top"){
      var $pants = $("#2");
      var $shoes = $("#3");
      if ($shoes || $pants) {
        $pants.hide();
        $shoes.hide();
        $("#1").fadeIn('slow');
      }
    }
  });
});

$(document).ready(function(){
  $("#clothing_clothing_type").change(function(){
    if($("#clothing_clothing_type").val() === "Bottom"){
      var $tops = $("#1");
      var $shoes = $("#3");
      if ($tops || $shoes) {
        $tops.hide();
        $shoes.hide();
        $("#2").fadeIn('slow');
      }
    }
  });
});

$(document).ready(function(){
  $("#clothing_clothing_type").change(function(){
    if($("#clothing_clothing_type").val() === "Shoes"){
      var $tops = $("#1");
      var $pants = $("#2");
      if ($tops || $pants) {
        $tops.hide();
        $pants.hide();
        $("#3").fadeIn('slow');
      }
    }
  });
});

$(document).ready(function(){
$(".container :checkbox").click(function () {
  if (displayShoes.checked) $(".hidden_option").show();
  else $(".hidden_option").hide();
  });
});
