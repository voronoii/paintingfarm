/* TOGGLE FUNCTION */
jQuery.fn.toggle = function( fn, fn2 ) {
  // Don't mess with animation or css toggles
  if ( !jQuery.isFunction( fn ) || !jQuery.isFunction( fn2 ) ) {
    return oldToggle.apply( this, arguments );
  }
  // migrateWarn("jQuery.fn.toggle(handler, handler...) is deprecated");
  // Save reference to arguments for access in closure
  var args = arguments,
  guid = fn.guid || jQuery.guid++,
  i = 0,
  toggler = function( event ) {
    // Figure out which function to execute
    var lastToggle = ( jQuery._data( this, "lastToggle" + fn.guid ) || 0 ) % i;
    jQuery._data( this, "lastToggle" + fn.guid, lastToggle + 1 );
    // Make sure that clicks stop
    event.preventDefault();
    // and execute the function
    return args[ lastToggle ].apply( this, arguments ) || false;
  };
  // link all the functions, so any of them can unbind this click handler
  toggler.guid = guid;
  while ( i < args.length ) {
    args[ i++ ].guid = guid;
  }
  return this.click( toggler );
};

$(window).resize(function(){
  $(".full-height").height($(window).height());
});
$(window).load(function(){
  $("#status").fadeOut();
  $("#preloader").delay(1000).fadeOut('slow');
  // WOW JS -----------------------------
  new WOW().init();
  // COUNTER  ------------------------------
  $('.timer').countTo();
});
$(document).ready(function() {

  /* --------------------------------------------
   Platform detect
   --------------------------------------------- */
  var mobileTest;
  if (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent)) {
      mobileTest = true;
      $("html").addClass("mobile");
  }
  else {
      mobileTest = false;
      $("html").addClass("no-mobile");
  }
  // Parallax        
  if (($(window).width() >= 1024) && (mobileTest == false)) {
    $('.quote-section').parallax("50%", -0.1);
    $('.parallax-section').parallax("50%", -0.1);
    $('.cover').parallax("50%", -0.2);
  };
  // DRAG SLIDER -----------------------
  var dragFolio = $("#drag-carousel");
  var dragFolioRelated = $("#drag-carousel-related");
  var dragClients = $(".brand-list-carousel");
  var dragBlog = $(".blog-carousel-articles");

  dragClients.owlCarousel({
      items : 7, //10 items above 1000px browser width
      autoPlay: true,
      itemsDesktop : [1000,5], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,3], // betweem 900px and 601px
      itemsTablet: [600,2], //2 items between 600 and 0
      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
  });

  $(".rotate").textrotator({
    animation: "flipCubeUp", // You can pick the way it animates when rotating through words. Options are dissolve (default), fade, flip, flipUp, flipCube, flipCubeUp and spin.
    separator: ",", // If you don't want commas to be the separator, you can define a new separator (|, &, * etc.) by yourself using this field.
    speed: 1500 // How many milliseconds until the next word show.
  });
  // PORTFOLIO LIGHTBOX -----------------------
  $('.lightbox a').magnificPopup({ 
    type: 'image'
  });
  $('.video-button').magnificPopup({ 
        disableOn: 700,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false 
  });

  // Accordion---------------------

  var allPanels = $(".m-accordion > dd").hide();
  allPanels.first().slideDown();
  $(".m-accordion > dt ").first().addClass("active");
  
  $(".m-accordion > dt ").click(function(){
  
      var current = $(this).next("dd");
      $(".m-accordion > dt").removeClass("active");
      $(this).addClass("active");
      allPanels.not(current).slideUp(200);
      $(this).next().slideDown(200);
      
      return false;
      
  });
  // TOGGLE -----------------------
  $(".m-toggle > dd").hide();
  $('.m-toggle>dt').toggle(function(){
      $(this).addClass('active');
      $(this).next().slideDown(300);
    },
    function(){
      $(this).removeClass('active');
      $(this).next().slideUp(300);
  });
  // TABS  ------------------------------
    tabby.init();
  // PROGRESS BAR --------------------------
  $('.m-pgs-bar-percent').each(function(){
    var progressPercent = $(this).data('percent');

    $(this).animate({width: progressPercent+'%'});
    $(this).prev().append(' '+progressPercent+'%');
  });
   $('.m-pgs-bar-thin-percent').each(function(){
    var progressPercent = $(this).data('percent');

    $(this).animate({width: progressPercent+'%'});
    $(this).next().append(' '+progressPercent+'%');
  });
  /* ---------------------------------------------
   Height 100%
   --------------------------------------------- */
  $(".full-height").height($(window).height());

  // HOVER EFFECTS -----------------------

  //PORTFOLIO
  $(".portfolio-item a, .portfolio-drag-item a").hover(function(){
      $(this).children(".portfolio-item-caption").stop().animate({opacity:1},200);
      $(this).children(".cap-bg").stop().animate({opacity:.9},200);
  }, function() {
      $(this).children(".portfolio-item-caption").stop().animate({opacity:0},200);
      $(this).children(".cap-bg").stop().animate({opacity:0},200);
  });

  // SEARCH MODAL --------------------
  $('.search-button, .search-btn-resp').click(function(){
    $('.search-modal').fadeIn();
    $('.search-modal-wrap').css('margin-top','220px');
  });
  $('#searchClose').click(function(){
    $('.search-modal').fadeOut();
    $('.search-modal-wrap').css('margin-top','50px');
  });
  // CART MODAL --------------------
  $('.cart-button').click(function(){
    $('.cart-modal').fadeIn();
    $('.cart-modal-wrap').css('margin-top','220px');
  });
  $('#cartClose').click(function(){
    $('.cart-modal').fadeOut();
    $('.cart-modal-wrap').css('margin-top','50px');
  });
  // RESPONSIVE NAVIGATION  --------------------
  $('.responsive-trigger').toggle(function(){
    $(this).children('i').removeClass('icon-list2').addClass('icon-cross');
    $('.responsive-navigation').slideDown(300);
    },
    function(){
      $(this).children('i').removeClass('icon-cross').addClass('icon-list2');
      $('.responsive-navigation').slideUp(300);
  });
  // RESPONSIVE NAVIGATION  --------------------
  $('.submenu-trigger').toggle(function(){
    $(this).children('i').removeClass('icon-arrow-down5').addClass('icon-arrow-up4');
    $(this).next('ul').slideDown(300);
    },
    function(){
      $(this).children('i').removeClass('icon-arrow-up4').addClass('icon-arrow-down5');
      $(this).next('ul').slideUp(300);
  });
  // BUTTON STYLE SWITCHER --------------------
  $('.button-switcher').toggle(function(){
    $('.style-switcher').stop().animate({left:0},200);
    },
    function(){$('.style-switcher').stop().animate({left:"-50px"},200);
  });
  // LOCAL SCROLL --------------------------
  $.localScroll({
    target:'.body',
    offset: {left: 0, top: -70}
  });

  // DROPDOWN MENU  --------------------------
  $('.primary-navigation>ul>li').children('ul').parent().addClass('dropped');
  $('.primary-navigation>ul>li>ul').hide();
  $( '.primary-navigation>ul>li.dropped' ).hover(
        function(){
            $(this).children('.primary-navigation>ul>li.dropped>ul').stop().fadeIn(200);
            $(this).children('.primary-navigation>ul>li.dropped>ul').css('top','70px');
        },
        function(){
            $(this).children('.primary-navigation>ul>li.dropped>ul').stop().fadeOut(200);
            $(this).children('.primary-navigation>ul>li.dropped>ul').css('top','120px');
        }
    );
  // Mega Menu -----------------------------------
  $(".mega-menu").width($('.header-container').width());
  $(".mega-menu").parent().addClass('mm');
  // 3Th Level Menu ------------------------------
  $('.primary-navigation>ul>li>ul:not(.mega-menu)>li').children('ul').parent().addClass('dropped-l3');
  $('.primary-navigation>ul>li>ul:not(.mega-menu)>li>ul').hide();
  $('.primary-navigation>ul>li>ul>li.dropped-l3' ).hover(
        function(){
            $(this).children('.primary-navigation>ul>li>ul>li.dropped-l3>ul').stop().fadeIn(200);
            $(this).children('.primary-navigation>ul>li>ul>li.dropped-l3>ul').css('left','100%');
        },
        function(){
            $(this).children('.primary-navigation>ul>li>ul>li.dropped-l3>ul').stop().fadeOut(200);
            $(this).children('.primary-navigation>ul>li>ul>li.dropped-l3>ul').css('left','120%');
        }
    );
  $(".primary-navigation>ul>li>ul:not(.mega-menu)>li>ul")
  // BACK TO TOP  --------------------------
  $('#backTop').click(function(){
    $("html, body").animate({scrollTop:0},'slow');
    return false;
  });

  // FLEXSLIDER -----------------------
    $('.quote-slider, .quote-slider-white').flexslider({
      animation: "fade",
      directionNav: false
    });
    $('.blog-article-gallrey').flexslider({
      animation: "slide",
      controlNav: false
    });
    $('.blog-masonry-article-gallrey').flexslider({
      animation: "slide",
      controlNav: false
    });
    $('.project-media-gallrey').flexslider({
      animation: "slide",
      controlNav: false
    });
    $('.single-product-gallrey').flexslider({
      animation: "slide",
      animationSpeed: 300,
      directionNav: false,
      controlNav: "thumbnails"
  });
  // REVOLUTION SLIDER ---------------------------------------
  jQuery('.banner').show().revolution(
    {
      dottedOverlay:"none",
      delay:8000,
      startwidth:1170,
      startheight:700,
      hideThumbs:200,
      
      thumbWidth:100,
      thumbHeight:50,
      thumbAmount:5,
      
      hideTimerBar: "on",
      navigationType:"bullet",
      navigationArrows:"solo",
      navigationStyle:"preview4",
      
      touchenabled:"on",
      onHoverStop:"on",
      
      swipe_velocity: 0.7,
      swipe_min_touches: 1,
      swipe_max_touches: 1,
      drag_block_vertical: false,
                 
      parallax:"mouse",
      parallaxBgFreeze:"on",
      parallaxLevels:[7,4,3,2,5,4,3,2,1,0],
                  
      keyboardNavigation:"off",
      
      navigationHAlign:"center",
      navigationVAlign:"bottom",
      navigationHOffset:0,
      navigationVOffset:20,

      soloArrowLeftHalign:"left",
      soloArrowLeftValign:"center",
      soloArrowLeftHOffset:20,
      soloArrowLeftVOffset:0,

      soloArrowRightHalign:"right",
      soloArrowRightValign:"center",
      soloArrowRightHOffset:20,
      soloArrowRightVOffset:0,
          
      shadow:0,
      fullWidth:"off",
      fullScreen:"on",

      spinner:"spinner4",
      
      stopLoop:"off",
      stopAfterLoops:-1,
      stopAtSlide:-1,

      shuffle:"off",
      
      autoHeight:"off",           
      forceFullWidth:"off",           
                  
                  
                  
      hideThumbsOnMobile:"off",
      hideNavDelayOnMobile:1500,            
      hideBulletsOnMobile:"off",
      hideArrowsOnMobile:"off",
      hideThumbsUnderResolution:0,
      
      hideSliderAtLimit:0,
      hideCaptionAtLimit:0,
      hideAllCaptionAtLilmit:0,
      startWithSlide:0,
      fullScreenOffsetContainer: ".header"  
    });
});


$(window).scroll(function() {
  // HEADER TRANSPARENT  SCROLL
  if ($(document).scrollTop() >= 90){  
    $('.home-t-h header').removeClass("transparent");
    $('.home-t-h-b header').removeClass("transparent-dark");
    if($('.home-t-h header').hasClass('white-header')){
      $('.logo').addClass('black-logo');
    }
  } 
  else{
    $('.home-t-h header').addClass("transparent");
    $('.home-t-h-b header').addClass("transparent-dark");
  }
  //SELECTED MENU SCROLL --------------------
  if($('body').hasClass('home')){
    var currentNode = null;
    $('.section-area').each(function(){
      var currentId = jQuery(this).attr('id');    
      if(jQuery(window).scrollTop() >= jQuery('#'+currentId).offset().top - 95)
      {
        currentNode = currentId;
      }
    });
    $('.primary-navigation li').removeClass('selected').find('a[href="#'+currentNode+'"]').parent().addClass('selected');
  }
  // BACK TO TOP SHOW
  if ($(document).scrollTop() >= $(window).height()){  
    $('.back-to-top').show();
  }else{
    $('.back-to-top').hide();
  }
});

$(window).load(function(){
  // MASONRY BLOG -----------------------
  var $blog = $('.blog-articles-masonry-container')
  $blog.imagesLoaded(function(){
    $blog.masonry({
      itemSelector : '.blog-article-masonry',
    });
  });
  // ISOTOPE --------------------
  var isotope_mode;
  var $container = $('.portfolio-container');
  if ($container.hasClass("masonry")){
       isotope_mode = "masonry";
   } else{
       isotope_mode = "fitRows"
   }
  $container.isotope({
    itemSelector : '.portfolio-item',
    layoutMode : isotope_mode,
    // disable resizing
    resizable: false,
    // set columnWidth to a percentage of container width
    masonry: {
      columnWidth: $container.width() / 12
    },
   });
  
  // update columnWidth on window resize
  $(window).resize(function(){
    $container.isotope({
      // set columnWidth to a percentage of container width
      masonry: {
        columnWidth: $container.width() / 12
      }
    });
  });
  $('.portfolio-filter a').click(function(){
       var selector = $(this).attr('data-filter');
       $container.isotope({
         filter: selector,
         animationOptions: {
           duration: 750,
           easing: 'linear',
           queue: false,
         }
       });
       return false;
     });

    var $optionSets = $('.portfolio-filter'),
    $optionLinks = $optionSets.find('a');

    $optionLinks.click(function() {

      var $this = $(this);
      // don't proceed if already selected
      if ( $this.hasClass('current-filter') ) {
        return false;
      }
      var $optionSet = $this.parents('.portfolio-filter');
      $optionSet.find('.current-filter').removeClass('current-filter');
      $this.addClass('current-filter');

      // make option object dynamically, i.e. { filter: '.my-filter-class' }
      var options = {},
          key = $optionSet.attr('data-option-key'),
          value = $this.attr('data-filter');
      // parse 'false' as false boolean
      value = value === 'false' ? false : value;
      options[ key ] = value;
      if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
        // changes in layout modes need extra logic
        changeLayoutMode( $this, options )
      } else {
        // otherwise, apply new options
        $container.isotope( options );
      }
      
      return false;
    });
});

// DISABLE HOVER ON SCROLL *******************
var body = document.body,
    timer;

window.addEventListener('scroll', function() {
  clearTimeout(timer);
  if(!body.classList.contains('disable-hover')) {
    body.classList.add('disable-hover')
  }
  
  timer = setTimeout(function(){
    body.classList.remove('disable-hover')
  },500);
}, false);

//***********************************
// Find all YouTube videos
var $allVideos = $("iframe[src^='//www.youtube.com'], iframe[src^='//www.youtube.com']"),

    // The element that is fluid width
    $fluidEl = $("body");

// Figure out and save aspect ratio for each video
$allVideos.each(function() {

  $(this)
    .data('aspectRatio', this.height / this.width)

    // and remove the hard coded width/height
    .removeAttr('height')
    .removeAttr('width');

});

// When the window is resized
$(window).resize(function() {

  var newWidth = $fluidEl.width();

  // Resize all videos according to their own aspect ratio
  $allVideos.each(function() {

    var $el = $(this);
    $el
      .width(newWidth)
      .height(newWidth * $el.data('aspectRatio'));

  });

// Kick off one resize to fix all videos on page load
}).resize();

$("#contactForm").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        formError();
        submitMSG(false, "Did you fill in the form properly?");
    } else {
        // everything looks good!
        event.preventDefault();
        submitForm();
    }
});

/******************* 
***** FORM SCRIPT  
*******************/
function submitForm(){
    // Initiate Variables With Form Content
    var name = $("#name").val();
    var email = $("#email").val();
    var message = $("#message").val();

    $.ajax({
        type: "POST",
        url: "php/form-process.php",
        data: "name=" + name + "&email=" + email + "&message=" + message,
        success : function(text){
            if (text == "success"){
                formSuccess();
            } else {
                formError();
                submitMSG(false,text);
            }
        }
    });
}

function formSuccess(){
    $("#contactForm")[0].reset();
    submitMSG(true, "Message Submitted!")
}

function formError(){
    $("#contactForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
        $(this).removeClass();
    });
}

function submitMSG(valid, msg){
    if(valid){
        var msgClasses = "align-center tada animated text-success";
    } else {
        var msgClasses = "align-center text-danger";
    }
    $("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
}

//파일업로드 관련 js
//Reference: 
//http://www.onextrapixel.com/2012/12/10/how-to-create-a-custom-file-input-with-jquery-css3-and-php/
;(function($) {

		  // Browser supports HTML5 multiple file?
		  var multipleSupport = typeof $('<input/>')[0].multiple !== 'undefined',
		      isIE = /msie/i.test( navigator.userAgent );

		  $.fn.customFile = function() {

		    return this.each(function() {

		      var $file = $(this).addClass('custom-file-upload-hidden'), // the original file input
		          $wrap = $('<div class="file-upload-wrapper">'),
		          $input = $('<input type="text" class="file-upload-input" />'),
		          // Button that will be used in non-IE browsers
		          $button = $('<button type="button" class="file-upload-button">파일 선택</button>'),
		          // Hack for IE
		          $label = $('<label class="file-upload-button" for="'+ $file[0].id +'">파일 선택</label>');

		      // Hide by shifting to the left so we
		      // can still trigger events
		      $file.css({
		        position: 'absolute',
		        left: '-9999px'
		      });

		      $wrap.insertAfter( $file )
		        .append( $file, $input, ( isIE ? $label : $button ) );

		      // Prevent focus
		      $file.attr('tabIndex', -1);
		      $button.attr('tabIndex', -1);

		      $button.click(function () {
		        $file.focus().click(); // Open dialog
		      });

		      $file.change(function() {

		        var files = [], fileArr, filename;

		        // If multiple is supported then extract
		        // all filenames from the file array
		        if ( multipleSupport ) {
		          fileArr = $file[0].files;
		          for ( var i = 0, len = fileArr.length; i < len; i++ ) {
		            files.push( fileArr[i].name );
		          }
		          filename = files.join(', ');

		        // If not supported then just take the value
		        // and remove the path to just show the filename
		        } else {
		          filename = $file.val().split('\\').pop();
		        }

		        $input.val( filename ) // Set the value
		          .attr('title', filename) // Show filename in title tootlip
		          .focus(); // Regain focus

		      });

		      $input.on({
		        blur: function() { $file.trigger('blur'); },
		        keydown: function( e ) {
		          if ( e.which === 13 ) { // Enter
		            if ( !isIE ) { $file.trigger('click'); }
		          } else if ( e.which === 8 || e.which === 46 ) { // Backspace & Del
		            // On some browsers the value is read-only
		            // with this trick we remove the old input and add
		            // a clean clone with all the original events attached
		            $file.replaceWith( $file = $file.clone( true ) );
		            $file.trigger('change');
		            $input.val('');
		          } else if ( e.which === 9 ){ // TAB
		            return;
		          } else { // All other keys
		            return false;
		          }
		        }
		      });

		    });

		  };

		  // Old browser fallback
		  if ( !multipleSupport ) {
		    $( document ).on('change', 'input.customfile', function() {

		      var $this = $(this),
		          // Create a unique ID so we
		          // can attach the label to the input
		          uniqId = 'customfile_'+ (new Date()).getTime(),
		          $wrap = $this.parent(),

		          // Filter empty input
		          $inputs = $wrap.siblings().find('.file-upload-input')
		            .filter(function(){ return !this.value }),

		          $file = $('<input type="file" id="'+ uniqId +'" name="'+ $this.attr('name') +'"/>');

		      // 1ms timeout so it runs after all other events
		      // that modify the value have triggered
		      setTimeout(function() {
		        // Add a new input
		        if ( $this.val() ) {
		          // Check for empty fields to prevent
		          // creating new inputs when changing files
		          if ( !$inputs.length ) {
		            $wrap.after( $file );
		            $file.customFile();
		          }
		        // Remove and reorganize inputs
		        } else {
		          $inputs.parent().remove();
		          // Move the input so it's always last on the list
		          $wrap.appendTo( $wrap.parent() );
		          $wrap.find('input').focus();
		        }
		      }, 1);

		    });
		  }

}(jQuery));

$('input[type=file]').customFile();