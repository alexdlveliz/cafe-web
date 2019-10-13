module CurrentUserConcern
    #Este archivo está dentro de la carpeta Concerns, por eso necesitamos incluir lo siguiente
    extend ActiveSupport::Concern

    #Reescribiendo el método current_user
    #null object pattern
    def current_user
        super || guest_user
    end

    def guest_user
        OpenStruct.new( name: "Gest User", 
                        first_name: "Guest", 
                        last_name: "User", 
                        email: "guest@example.com"
                        )
    end
end