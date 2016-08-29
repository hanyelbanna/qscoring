$(document).on "page:change", ->
  Metronic.init()
  Layout.init()

$(document).on "page:update", ->
  $('#cancel-form').on "click", ->
   	$('#data-form').slideUp(350)


  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'


  $('[data-provider="summernote"]').each ->
    $(this).summernote()


  $('tbody tr').click ->
    $(this).addClass('selected').siblings().removeClass("selected")
