# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

UpdateCart = ->


setCountItems = ->
  data_count = $('.cart_count_items').attr('data-count')
  $('label#basket, .cart_count_product .count_product').attr('data-count', data_count)

$(document).ready ->

#  setCountItems()

  $('#form_add_to_cart button').click (e) ->
    e.preventDefault()

    parent = $(this).closest('form')
    count = parent.find("input.count_product").val()

    attrRenderID = $(this).attr('data-product-id')
#    t = "<div class=\"loading\" id=\"\"><img src=\"//firststop.s3.amazonaws.com/assets/loading-8eb13df64a37c56b9774c5160a0f0a9e.gif\"></div>"

    valuesToSubmit = {product_id: attrRenderID, quantity: count}
    $.ajax
      url: '/line_items'
      dataType: 'html'
      type: "POST"
      data: valuesToSubmit
      beforeSend: ->
        return
      success: (data) ->
        alert 'success'
        setCountItems()

        return

      complete: ->
        return

  $('.cart_items_list .delete-item').click (e) ->
    e.preventDefault()
    attrRenderID = $(this).attr('data-line-item-id')

#    valuesToSubmit = {line_item_id: attrRenderID}
    $.ajax
      url: '/line_items/'+attrRenderID
      dataType: 'html'
      type: "DELETE"
#      data: valuesToSubmit
      beforeSend: ->
        return
      success: (data) ->
        alert 'success'
        setCountItems()

        return

      complete: ->
        return

  $('.pd_product_pack_wrap button.cust_button').click ->
    $product_id = ""
    $product_quantity = ""
    $parent = $(this).closest('.pd_product_pack_wrap')
    $lis = $parent.find('.ppi_item_wrap')

    $produck_pack_id = $(this).attr 'data-product-pack-id'

    $tablecloth = $lis.filter('.pp-tablecloth-buy')
    $tableclothData = $tablecloth.attr 'data-product-id'
    $dirnkSet = $lis.filter('.pp-drink-set-buy')
    $drinkSetParent = $dirnkSet.parent().filter('.active')
    $drinkSetData = $drinkSetParent.children().attr 'data-product-id'
    if $dirnkSet.hasClass('one-item')
      $drinkSetData = $dirnkSet.attr 'data-product-id'

    $decors = $lis.filter('.pp-decor-buy')
    $decorsParent = $decors.parent().filter('.active')
    $decorsData = $decorsParent.children().attr 'data-product-id'
    if $decors.hasClass('one-item')
      $decorsData = $decors.attr 'data-product-id'

    alert 'id комплекту - '+$produck_pack_id+'\n'+'id скатертини - '+$tableclothData+'\n'+'id чайного сервізу - '+$drinkSetData+'\n'+'id декору - '+$decorsData

    valuesToSubmit = {product_id: $product_id, quantity: $product_quantity, product_pack_id: $produck_pack_id, p_drink_set_id: $drinkSetData, p_tablecloth_id:$tableclothData, p_decor_id: $decorsData}

    $.ajax
      url: '/line_items'
      dataType: 'html'
      type: "POST"
      data: valuesToSubmit
      beforeSend: ->
        return
      success: (data) ->
        alert 'success'
        setCountItems()

        return

      complete: ->
        return

#    valuesToSubmit = {tablecloth_id:$tableclothData, drink_set_id:$drinkSetData, decor_id:$decorsData}
#
#    $.ajax
#      url: '/add_products_pack'
#      type: "POST"
#      data: valuesToSubmit
#      beforeSend: ->
#        alert 'start send'
##        $('.status').removeClass('dn')
##        $(".status_inner").html "<img src=\"/assets/loader.gif\">"
#        return
#      success: (data) ->
#        alert 'added to cart'
##        $('form#order_game_form').css({'visibility':'hidden'})
##        $(".status_inner").html "Дякуюємо! Ми отримали ваші дані, найближчим часом з вами звяжеться наш менеджер."
#        return
#      complete: ->
#        alert 'complete'
##        $("form#c_feedback").each ->
##          @reset() #Here form fields will be cleared.
##          return
##        $('.status').addClass('dn')
#
#        return


#$(document).ready ->
#  $(document).on("click", ".add a", ->
#    t = "<div class=\"loading\" id=\"\"><img src=\"//firststop.s3.amazonaws.com/assets/loading-8eb13df64a37c56b9774c5160a0f0a9e.gif\"></div>"
#    $(this).parent().parent().prepend t
#    return
#  ).on("ajax:success", ".add a", (t, a) ->
#    $(this).parent().parent().find(".loading").html("<span>Item Added!</span>").delay("500").fadeOut("100", ->
#      $(this).remove()
#      return
#    )
#    cart_count(a.qty)
#    cart_total(a.subtotal)
#
#    return
#  ).on "ajax:error", ".add a", ->
#    $(this).parent().parent().find(".loading").html("<span>Sorry, there was an error :(</span>").delay("500").fadeOut "100", ->
#      $(this).remove()
#      return
#
#    return
#
#  return