class Event < ApplicationRecord

    #enum para poder definir el estado del evento.
    #   1 será para indicar que el evento es público
    #   0 será para indicar que el evento aún está en borrador
    enum status: { draft: 0, published: 1 }

    #Dándole la habilidad a los eventos de tener friendly routes
    extend FriendlyId
    friendly_id :name, use: :slugged

    #Validar los datos que deben tener los eventos para poder ser creados
    validates_presence_of :name, :description

    #Relación con los comentarios.
    #dependent: :destroy hace lo siguiente:
        #Si un evento se borra, también se borrarán los comentarios de ese evento
    has_many :comments, dependent: :destroy

    #método provisto por la gema carrierwave para poder utilizar las imágenes de AWS
    mount_uploader :thumb_image, EventUploader
    mount_uploader :main_image, EventUploader

    #Consultas directas a la base de datos
        #Métodos propios para traer eventos públicos o privados
        #Las líneas de abajo funcionan igual como que se dijera:
            # Event.where(status: 0) para draft
            # Event.where(status: 1) para published
    scope :draft_events, -> { draft }
    scope :published_events, -> { published }

    def self.by_position
        order("position ASC")
    end

end
