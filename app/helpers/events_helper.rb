module EventsHelper
    #Método para generar una imagen con las medidas especificadas
    def image_generator(height:, width:)
        "http://placehold.it/#{height}x#{width}"
    end

    #Método para volver a cargar las imágenes. Este método se integró
    #para poder seguir utilizando las imágenes de placehold.it al ya estar
    #integradas las imágenes con AWS
    def event_img img, type
        if img.model.main_image? || img.model.thumb_image?
            img
        elsif type == 'thumb'
            image_generator(height: '350', width: '200')
        elsif type == 'main'
            image_generator(height: '600', width: '400')
        end
    end

    #Método para poder poner una imagen al usuario que esté comentando un evento
    def gravatar_helper user
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
    end
end
