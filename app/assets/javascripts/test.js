// document.documentElement.className = document.documentElement.className.replace('no-js', ''); //Remove no-js class ASAP

$(function(){

    $.fn.replaceImageWithOneOfNewSrc = function(newSrc) {
        //Used in a few places to avoid blank.gif breaking imagesLoaded
        var newTag = $(this).clone().wrap('<div />').parent().html();
        newTag = newTag.replace(/(src=")([^"]*)/gi, "$1" + newSrc);
        var $newTag = $(newTag);
        $(this).after($newTag).remove();
        return $newTag;
    }

    //For fading in other images created by js
    function fadeInImageWhenReady($el, callback) {
        var $imgs = $el.is('img') ? $el : $el.find('img');
        $imgs.css('opacity', 0).imagesLoaded(function(){
            $imgs.animate({opacity: 1}, imageFadeInSpeed);
            if(callback) {
                callback();
            }
        });
    };

    //Enables any images inside a container
    function awakenImagesFromSlumber($cont) {
        $cont.find('img[data-src]').each(function(){
            $(this).replaceImageWithOneOfNewSrc($(this).data('src'));
        });
    };

    /// Collection-rows - show dropdown product detail
    function contractDetail($blocks) {
        if($blocks.length == 0) {
            if(typeof callback != 'undefined') callback();
        } else {
            $blocks.removeClass('expanded');
            $blocks.find('.product-detail').stop().animate({ height:0 }, droppyDownAnimSpeed);
            $blocks.stop().each(function(){
                $(this).animate({ paddingBottom: $(this).data('origPaddingBottom') }, droppyDownAnimSpeed);
            });
        }
    }

    function animateBlockHeight($block, heightToGetTo) {
        //Double padding on bottom, to mimic padding underneath block also being underneath detail
        $block.stop().animate({ paddingBottom:heightToGetTo + $block.data('origPaddingBottom')*3 }, droppyDownAnimSpeed);
        $block.find('.product-detail').stop().animate({ height:heightToGetTo }, droppyDownAnimSpeed);
    }

    var droppyDownAnimSpeed = 500;
    $(document).on('click', '.collection-listing:not(.related-tag-handle) .product-block:not(.collection-block) .more-info', function(){
        var $block = $(this).closest('.product-block');
        var $slider = $(this).closest('.collection-slider');
        var pageWidth = $(window).width();
        //Only show dropdown if screen is large enough for it to be useful
        if(pageWidth > 480) {
            if($slider.length > 0) {
                //Inside a collection slider
                var $detailCont = $slider.closest('.collection-slider-row').find('.slider-collection-listing .product-detail');
                if($detailCont.length == 1) {
                    if($block.hasClass('expanded')) {
                        //Just shrink it
                        $block.removeClass('expanded');
                        $detailCont.stop().animate({height: 0}, droppyDownAnimSpeed);
                    } else {
                        //Unexpand others, reveal this
                        $('html:not(:animated),body:not(:animated)').animate({ scrollTop: $block.offset().top }, 500 );
                        var noneExpanded = $slider.find('.product-block.expanded').removeClass('expanded').length == 0;
                        if(noneExpanded) {
                            $detailCont.height(0);
                        }
                        $detailCont.html($block.children('.product-detail').html());
                        //Set close button data
                        $detailCont.find('.close-detail').data('block', $block);
                        awakenImagesFromSlumber($detailCont);

                        //Event for when image size changes
                        var $inner = $detailCont.children('.inner');
                        $inner.unbind('changedsize').bind('changedsize', function(){
                            $detailCont.stop().animate({height: $detailCont.children('.inner').outerHeight()}, droppyDownAnimSpeed);
                        });

                        //Init dropdowns
                        $detailCont.find('select[name="id"]').each(function(){
                            //Change dropdown ID so it remains unique
                            $(this).attr('id', $(this).attr('id') + '-slidedrop');
                        }).trigger('optionate');

                        //Adjust height
                        $inner.trigger('changedsize');

                        fadeInImageWhenReady($inner, function(){
                            $inner.trigger('changedsize');
                        });

                        $block.addClass('expanded');
                    }
                }
            } else {
                //Normal collection page
                if($block.toggleClass('expanded').hasClass('expanded')) {
                    //Expand this one

                    //Contract neighbours
                    contractDetail($block.siblings('.expanded'));

                    $block.data('origPaddingBottom', parseInt($block.css('padding-bottom')));

                    var $inner = $block.find('.product-detail > .inner');

                    //Restore images
                    awakenImagesFromSlumber($inner);

                    //Init dropdowns (do after images init'd)
                    $block.find('select[name="id"]').trigger('optionate');

                    $inner.unbind('changedsize').bind('changedsize', function(){
                        //Check class in case slid-up before image loaded
                        if($block.hasClass('expanded')) {
                            animateBlockHeight($block, $inner.outerHeight());
                        }
                    });

                    //Slide down now
                    $inner.trigger('changedsize');

                    //Recalc height when images are loaded
                    fadeInImageWhenReady($inner, function(){
                        $inner.trigger('changedsize');
                    });


                    //Scroll
                    var offsetTop = typeof($block.data('offsetTop')) != 'undefined' ? $block.data('offsetTop') : $block.offset().top;
                    $('html:not(:animated),body:not(:animated)').animate({ scrollTop: offsetTop }, 500 );
                } else {
                    //Contract
                    contractDetail($block);
                }
            }
            return false;
        }
    });

    //Close button event
    $(document).on('click', '.product-detail .close-detail', function(){
        $(this).data('block').find('.more-info:first').trigger('click');
        return false;
    });

    //For each product block in a listing
    $('.collection-listing .product-block, .collection-listing-stream .product-block').each(function(){
        //Add close button
        $('<a href="#" class="close-detail">X</a>').data('block', $(this)).appendTo($(this).find('.product-detail'));
    });
});
