module CurrentUserConcern
    #Este archivo está dentro de la carpeta Concerns, por eso necesitamos incluir lo siguiente
    extend ActiveSupport::Concern

    #Reescribiendo el método current_user
    #null object pattern
    def current_user
        super || guest_user
    end

    #Se crea un 'guest user' basándose del modelo 'guest_user.rb'
    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        guest
    end
end