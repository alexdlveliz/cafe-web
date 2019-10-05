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
end
