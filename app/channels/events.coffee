#Se realiza una conexión directa con turbolinks.
#turbolinks carga todo el sistema en sí
jQuery(document).on 'turbolinks:load', ->
  #Busca un id llamado 'comments'
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create{
      channel: "EventsChannel"
      event_id: comments.data('event-id')
    },
    connected: ->
    disconnected: ->
    #Al recibir data, se van a concatenar todos los comentarios
    recieved: (data) ->
      comments.append data['comment']
    send_comment: (comment, event_id) ->
      @perform 'send_comment', comment: comment, event_id: event_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('#comment_content')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_comment textarea.val(),
      comments.data('event-id')
      textarea.val('')
    e.preventDefault()
    return false
