$(function(){
  var $age_slider = $('#user_age');
  
  $age_slider.on('change', function(){
    
    var $score = $age_slider.val();
    var $range_score = $('#range_score');
    
    console.log($score);
    $range_score.text($score);
  });
});