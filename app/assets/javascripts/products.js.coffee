@updateProductSubcategories = (element) ->
  $.getJSON '/categories/' + $(element).val(), (json) ->
    $("#product_subcategory_id").empty()
    $.each json, (key, val) ->
      html = "<option value=" + val.id + ">" + val.name + "</option>"
      $("#product_subcategory_id").append $(html)
