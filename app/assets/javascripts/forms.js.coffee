$(document).ready ->
  # Execute on load
  checkWidth()
  $(".phone-input").mask "+99 (999) 999 99 99",
  #    placeholder: "+38 (050) 417 07 28"

  validator = $(".validate-form").validate
    errorPlacement: (error, element) ->
      # Append error within linked label
      $(element).closest("form").find("label[for='" + element.attr("id") + "']").append error

    errorElement: "span"
    messages:
      user:
        required: " (required)"
        minlength: " (must be at least 3 characters)"

      password:
        required: " (required)"
        minlength: " (must be between 5 and 12 characters)"
        maxlength: " (must be between 5 and 12 characters)"