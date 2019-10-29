class CommentBroadCastJob < ApplicationJob
   #Significa que queremos tener una lista. En este caso, una lista de comentarios
   queue_as :default

   def perform(comment)
    #Da una conexión directa con el 'channel'
    ActionCable.server.broadcast "events_#{comment.event.id}_channel", comment: render_comment(comment)
   end

   private
   #Colocar el comentario en su determinado espacio
   def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
   end
end