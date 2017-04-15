$(document).on 'turbolinks:load', ->
  $("#message_content").emojioneArea
    autoHideFilters: true
    events: keypress: (editor, event) ->
      if event.which is 13 && !event.shiftKey
        $("#message_content").val $('#message_content').data('emojioneArea').getText()
        $('#new_message').submit()
        $('#message_content').data('emojioneArea').setText ""
        event.preventDefault()
      return
