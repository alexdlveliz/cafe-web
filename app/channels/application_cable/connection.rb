module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    #Definir un guest_user solo para ActionCable
    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end

    def connect
      #Cuando ocurra la conexión, mostrar en consola la siguiente información
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    protected
    #Método para verificar al usuario
    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      end
    end
  end
end
