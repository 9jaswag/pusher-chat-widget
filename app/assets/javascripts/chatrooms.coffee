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
    chatroom = data.detail[0]
    $('.chat-form').removeClass('collapse')
    $('.start-chat-wrapper').addClass('collapse')
    $('.chat-wrapper').removeClass('collapse')
    $('#chat-form #name').val(chatroom.name)
    $('#chat-form #chatroom_id').val(chatroom.id)
    getChats chatroom.id
    $('#start-chat-form')[0].reset()
    return

  getChats = (id) ->
    token = $('meta[name="csrf-token"]').attr('content')
    $.ajax
      url: 'chatrooms/' + id
      type: 'get'
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', token
        return
      success: (data) ->
        console.log data
        return
    return
  
  updateChat = (data) ->
    $('.chats').append """
      <div class="chat-bubble-wrapper d-block">
        <div class="chat-bubble bg-dark p-1 text-white my-1 d-inline-block">
          <small class="chat-username">#{data.name}</small>
          <p class="m-0 chat-message">#{data.message}</p>
        </div>
      </div>
    """
    return

  $('#chat-form').on 'ajax:success', (data) ->
    chat = data.detail[0]
    console.log chat
    updateChat chat
    $('#chat-form')[0].reset()
    return

  loadAdminChat = (chatArray) ->
    $('.admin-chats').html ""
    $.map(chatArray.chats, (chat) ->
      # Do something
      $('.admin-chats').append """
        <div class="chat-bubble-wrapper d-block">
          <div class="chat-bubble bg-dark p-1 text-white my-1 d-inline-block" style="min-width: 10rem;">
            <small class="chat-username">#{chat.name}</small>
            <p class="m-0 chat-message">#{chat.message}</p>
          </div>
        </div>
      """
      return
    )
    # $('.admin-chats').append chats
    return
  
  $(".sidebar-chat").on 'ajax:success', (data) ->
    chat = data.detail[0]
    # console.log chat
    loadAdminChat chat
