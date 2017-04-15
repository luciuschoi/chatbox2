App.chatting = App.cable.subscriptions.create "ChattingChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # console.log data.to.user_id + ' : ' + data.content
    unless data.message.blank?
      $("#messages").append data.message
      scroll_bottom()
      PR.prettyPrint()


scroll_bottom = ->
  $("#chatting").scrollTop $("#chatting")[0].scrollHeight

# submit_message = ->
#   $("#message_content").on 'keydown', (event) ->
#     if event.keyCode is 13 && !event.shiftKey
#       $('input[type=submit]').click()
#       event.target.value = ""
#       event.preventDefault()

$(document).on "turbolinks:load", ->
  # submit_message()
  scroll_bottom()
