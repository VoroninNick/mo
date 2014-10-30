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