# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready =>
  popupWrapper = $('.popup-wrapper')
  popupTrigger = $('.popup-trigger')

  $('.popup-head').click ->
    popupWrapper.addClass('collapse')
    popupTrigger.removeClass('collapse')
    return

  $('.popup-trigger').click ->
    popupWrapper.removeClass('collapse')
    popupTrigger.addClass('collapse')
    return

  $('#start-chat-form').on 'ajax:success', (data) ->
    console.log data.detail[0]
    $('#start-chat-form')[0].reset()
    return
