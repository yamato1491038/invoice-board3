$(function(){

  setTimeout(function(){
    $('.SigninPage__mask').animate({
      'width': '0vh'
    }, 500);
  }, 500);

  setTimeout(function(){
    $('.SigninPage__image__contents__line').animate({
      'height': '400px'
    }, 500, function(){
      $('.SigninPage__image__contents__line__title').animate({
        'opacity': '1'
      }, 300)
    });
  }, 1000);

  $('.SigninPage__image__contents__line__title__line3').click(function(){
    $('.SigninPage__image__contents__line').animate({
      'width': '1100px'
    }, 500, function(){
      $('.SigninPage__image__contents__line__right.display-none').removeClass('display-none')
      $('.SigninPage__image__contents__line__right').animate({
        'opacity': '1'
      }, 1000)
    })
  });
});