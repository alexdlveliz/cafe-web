class EventsChannel < ApplicationCable::Channel
    def subscribed
        #Va a buscar dentro de los parámetros el id del evento
        stream_from "events_#{params['event_id']}_channel"
    end

    def unsubscribed
    end

    #Método utilizado para enviar el comentario escrito por el usuario. Se envían como comentarios:
        #El contenido del comentario.
        #El id del evento que se está comentando.
    def send_comment(data)
        current_user.comments.create!(content: data['comment'], event_id: data['event_id'])
    end
end