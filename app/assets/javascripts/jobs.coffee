# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.initJobs = ->

  scrollTo = (element) ->
    $('html, body').animate
      scrollTop: $(element).offset().top
    , 500

  step2 = () ->
    $('.step2').show()
    $('#job_author').focus()
    scrollTo('.step2')

  step3 = () ->
    $('.step3').show()
    $('.goto_step3').hide()
    $('#job_title').focus()
    scrollTo('.step3')

  $(document).on 'change', '#job_company_id', ->
    if $(this).val().length > 0
      step2()
    else
      $('.step2, .step3').hide()

  $(document).on 'click', '.goto_step3', ->
    step3()

  $("#new_job input, #new_job select").on "keypress", (e) ->
    if e.keyCode == 13
      if $('.step2').is(':visible') && !$('.step3').is(':visible')
        step3()
      false
