#Preparar el DOM para trabajar con turbolinks
jQuery(document).on 'turbolinks:load', ->
  #Igualar la variable comments al elemento que contenta el id comments
  comments = $('#comments')
  if comments.length > 0
    #Crear la comunicación para EventsChannel (clase)
    App.global_chat = App.cable.subscriptions.create {
      channel: "EventsChannel"
      event_id: comments.data('event-id')
    },
    connected: ->
    disconnected: ->
    #Al recibir data haga algo
    received: (data) ->
      #Se concatenan los comentarios ya guardados y el 
      #que está siendo creado en ese momento
      comments.append data['comment']
    #Se llama al método 'send_comment' y se le mandando parámemtros
    send_comment: (comment, event_id) ->
      @perform 'send_comment', comment: comment, event_id: event_id
  #Al presionar en el botón, haga lo siguiente
  $('#new_comment').submit (e) ->
    $this = $(this)
    #Igualar la variable 'textarea' al elemento comment_content
    textarea = $this.find('#comment_content')
    #Condición para quitar los espacios iniciales que pueda tener el comentario
    if $.trim(textarea.val()).length > 1
      #Enviar el comentario  escrito por el usuario
      App.global_chat.send_comment textarea.val(),
      comments.data('event-id')
      #Limpiar el espacio de comentarios, ponerlo en blanco
      textarea.val('')
    e.preventDefault()
    return false
