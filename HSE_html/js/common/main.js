/*==============================================================
* Generated by somangLee on 2022-01-17
==============================================================*/
$(document).ready(function(){

  //header-active
  $('.gnb li a').on('focusin mouseover', function(e){
    $('body').addClass('header-active');
    e.preventDefault();
  });

  //company select
  $('.header-cont .select-btn').click(function(){
    $(this).parents('.header-cont').toggleClass('open');
  });

  $(document).mouseup(function (e){
    var select_open = $('.header-cont.open');
    if(select_open.has(e.target).length === 0){
      select_open.removeClass('open');
    }
  });

  //sub-cont3 tab
  $('.tab-menu li').click(function(){
    var tab = $(this).attr('tab');
    if(!$(this).hasClass('current')) {
      //class remove
      $(this).siblings('li').removeClass('current');
      $(this).parents('.tit-area').siblings('.tab-content').removeClass('current');

      //class add
      $(this).addClass('current');
      $(this).parents('.tit-area').siblings('div[tab='  + tab + ']').addClass('current');
    }
  });

  //count
  $('.count').each(function () {
    var $this = $(this),
      countTo = $this.attr('data-count');

    $({
      countNum: $this.text()
    }).animate({
        countNum: countTo
      },

      {
        duration: 1500,
        easing: 'linear',
        step: function () {
          $this.text(Math.floor(this.countNum));
        },
        complete: function () {
          $this.text(this.countNum);
        }
      });

  });

});

