$(document).ready ->
  # Execute on load
  $(".phone-input").mask "+99 (999) 999 99 99"

  validator = $(".validate-form").validate()
  #    errorPlacement: (error, element) ->
  #      # Append error within linked label
  #      $(element).closest("form").find("label[for='" + element.attr("id") + "']").append error
  #
  #    errorElement: "span"
  #    messages:
  #      user:
  #        required: " (required)"
  #        minlength: " (must be at least 3 characters)"
  #
  #      password:
  #        required: " (required)"
  #        minlength: " (must be between 5 and 12 characters)"
  #        maxlength: " (must be between 5 and 12 characters)"


  $('form.mo-form').submit (event) ->
  # Stop the browser from submitting the form.
    event.preventDefault()
  # Serialize the form data.
    $currentElement = $(this)
    $buttonWrap = $currentElement.find('.input_send_data')
    undoElement = $buttonWrap.children()

    $thisForm = $(this).closest('form')
    formData = $thisForm.serialize()
  # Submit the form using AJAX.
    $.ajax
      type: "POST"
      url: $thisForm.attr("action")
      data: formData
      beforeSend: ->
        $buttonWrap.children().remove()
        $buttonWrap.append('<div class="status-adding">Надсилання...</div>')
      success: ->
        $buttonWrap.children().remove()
        $buttonWrap.append('<div class="status-adding">Надіслано!</div>')
      complete: ->
        setTimeout (->
          $buttonWrap.children().remove()
          $buttonWrap.html(undoElement)
          $thisForm.find("input[type=text],input[type=email], textarea").val("")
        ), 3000
      error: ->
        alert "Something went wrong!"


  $('#ordering-finish-step').click ->
    formData = ''
    # Submit the form using AJAX.
    $.ajax
      type: "POST"
      url: "/order_product"
      data: formData
      beforeSend: ->
        alert "Відсилання...ddddddd"
      success: ->
        alert "success"
      error: ->
        alert "Something went wrong!"