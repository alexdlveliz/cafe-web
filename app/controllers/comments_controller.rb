#Clase creada al ejectuar 'rails g resource Comment'
class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.build(comment_params)
    end

    private
    #Se definen los parámetros que va a aceptar el método create al momento de crear un comentario
    def comment_params
        params.require(:comment).permit(:content)
    end
end
