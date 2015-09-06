/*
*-------------------------------------
*   Script for Relevant V-Card.
*   Please not Copy this.
*-------------------------------------
*/
;(function($){

    'use-strict';

    /*
    *-------------------------------------
    *  Init Foundation js
    *-------------------------------------
    */
    $(document).foundation();

    /*
    *-------------------------------------
    *  Convert $('[data-js='elem']') to $.js('elem')
    *-------------------------------------
    */
    $.js = function(el){
      return $('[data-js=' + el + ']');
    };

    /*
    *-------------------------------------
    * Data-text
    * Example:
    * <a data-js="img" data-img="image.jpg">get</a>
    *
    *-------------------------------------
    */
    $.js('img').on('click', function(e) {
      e.preventDefault();
      img = $(this).data('img');
      // Append data in div id data
      $('#data').html('<img  src="'+ img +'"  width="100%"/>');
      // Show Modal
      $('#modal').foundation('reveal', 'open');
    });

  
    /*
    *-------------------------------------
    * Data-text
    * Example:
    * <a data-js="text" data-text="hello world">get</a>
    *
    *-------------------------------------
    */
    $.js('text').on('click', function(e) {
      e.preventDefault();
      head = $(this).data('head');
      text = $(this).data('text');
      // Append data in div id data
      $('#data').html('<h3>'+head+'</h3><p>'+ text +'</p>');
      // Show Modal
      $('#modal').foundation('reveal', 'open');
    });
    
    
    /*
    *-------------------------------------
    * Data-iframe
    * Example:
    *  Copy  src frame and paste in data-frame
    *  like a  http://www.youtube.com/embed/um3eABjLhkQ
    * <a data-js="iframe" data-iframe="url">get</a>
    *
    *-------------------------------------
    */
    $.js('iframe').on('click', function(e) {
      e.preventDefault();
      iframe = $(this).data('iframe');
      // Append data in div id data
      $('#data').html('<iframe '+
                      'width="100%"'+
                      'height="390"'+
                      'src="'+ iframe +'"'+
                      'frameborder="0"'+
                      '></iframe>');
      // Show Modal
      $('#modal').foundation('reveal', 'open');
    });
        
    /*
    *-------------------------------------
    * Loader
    *  Html 
    *  <div id="loader"></div>
    *  <div id="page"> Web content here </div>
    *-------------------------------------
    */
    $('#page,#main_footer').css('display','none');
    $(window).load(function(){
      $('#loader').fadeOut('slow',function(){
        $('#page,#main_footer').css('display','block');
        $(this).remove();
      });
    });

    /*
    *-------------------------------------
    * Portfolio filter
    *  Html 
    *  <a class="happy filter"></a>
    *  <div class="happy"> Content here </div>
    *-------------------------------------
    */
    $(document).ready(function(){
      // Portfolio
      if($('#filter').length){
        $('ul#filter a').click(function(){
          // Remove class
          $('ul#filter .current').removeClass('current');
          // Add parent class
          $(this).parent().addClass('current');
          // find same class of menu
          var filterVal = $(this).text().toLowerCase().replace(' ','-');
          if(filterVal == 'all') {
            // If click all execute this
            $('ul#portfolio li').animate({opacity: 1},1000);
          }else{
            // Each all and filter values
            $('ul#portfolio li').each(function() {
              // Hide 
              if(!$(this).hasClass(filterVal)) { $(this).animate({ opacity: 0.1 },1000);}
              // Show
              else{ $(this).animate({opacity: 1},1000);}
            });
          }
          return false;
        });
      }
    });
 
})(jQuery);