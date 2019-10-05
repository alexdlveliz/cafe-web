class Event < ApplicationRecord

    #enum para poder definir el estado del evento.
    #   1 será para indicar que el evento es público
    #   0 será para indicar que el evento aún está en borrador
    enum status: { draft: 0, published: 1 }

    #Dándole la habilidad a los eventos de tener friendly routes
    extend FriendlyId
    friendly_id :name, use: :slugged

    #Validar los datos que deben tener los eventos para poder ser creados
    validates_presence_of :name, :description, :main_image, :thumb_image

    #Consultas directas a la base de datos
        #Métodos propios para traer eventos públicos o privados
        #Las líneas de abajo funcionan igual como que se dijera:
            # Event.where(status: 0) para draft
            # Event.where(status: 1) para published
    scope :draft_events, -> { draft }
    scope :published_events, -> { published }

    after_initialize :set_defaults

    def set_defaults
        # ||= es como decir
        # if self.main_image == nil
        #   self.main_image = "http://placehold.it/600x400"
        # end
        self.main_image ||= "http://placehold.it/600x400"
        self.thumb_image ||= "http://placehold.it/350x200"
    end
end
