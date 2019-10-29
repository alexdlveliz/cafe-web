class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  #Validar que haya contenido en el campo 'content'
  #Y que la cantidad mínima de caracteres sea de 5, y la máxima de 1000
  validates :content, presence: true, length: { minimum: 5, maximum:1000 }

  #Crear el broadcast para los comentarios cuando se presione el botón de enviar comentario
  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
