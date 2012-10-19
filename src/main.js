(function(){

  var optionsContainer;
  var faceContainer;

  function changeMood(mood){
    faceContainer.setAttribute('data-mood', mood);
  }
  
  document.addEventListener('DOMContentLoaded', function(e){
    var moodSelectElement;

    optionsContainer = document.querySelector('.options');
    moodSelectElement = optionsContainer.querySelector('.mood');
    faceContainer = document.querySelector('.face');

    moodSelectElement.addEventListener('change', function(e){
      changeMood(e.target.value);
    }, false);

  }, false);

}());