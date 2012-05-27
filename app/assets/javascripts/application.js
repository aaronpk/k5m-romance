// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
  $(".vote-btn").click(function(){

    var candidate_id = $(this).data("candidate-id");
    var vote = $(this).hasClass("yes") ? "yes" : "no";

    $("#votepercent-"+candidate_id+"-"+vote+", #vote-"+candidate_id+"-"+vote).removeClass("inactive");
    $("#votepercent-"+candidate_id+"-"+(vote == "yes" ? "no" : "yes")+", #vote-"+candidate_id+"-"+(vote == "yes" ? "no" : "yes")).addClass("inactive");

    $.post("/votes.json", {
      "vote[candidate_id]": parseInt(candidate_id),
      "vote_value": vote
    }, function(e){
      $("#votepercent-"+e.candidate_id+"-yes").text(e.vote.yes_percent+"%");
      $("#votepercent-"+e.candidate_id+"-no").text(e.vote.no_percent+"%");
    });
  });
});

