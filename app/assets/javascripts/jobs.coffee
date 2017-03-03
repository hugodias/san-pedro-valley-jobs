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

  $(document).on 'click', '#goto_step2', (event) ->

    event.preventDefault()

    if $('#job_company_params_title').val().length > 0
      if $('#job_company_params_website').val().length > 0
        if $('#job_company_params_email').val().length > 0
          if $('#job_company_params_address').val().length > 0
            step2();
          else
            alert 'Você precisa selecionar o endereço da startup.'
            $('.step2, .step3').hide()
        else
          alert 'Você precisa selecionar o email da startup.'
          $('.step2, .step3').hide()
      else
        alert 'Você precisa selecionar o website da startup.'
        $('.step2, .step3').hide()
    else
      alert 'Você precisa selecionar o nome da startup.'
      $('.step2, .step3').hide()


  $(document).on 'click', '.goto_step3', ->
    step3()

  $("#new_job input, #new_job select").on "keypress", (e) ->
    if e.keyCode == 13
      if $('.step2').is(':visible') && !$('.step3').is(':visible')
        step3()
      false
