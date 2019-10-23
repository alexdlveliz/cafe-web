#Módulo para definir la lista de parámetros que puede recibir el 'devise'
module DeviseWhitelist
    #Este archivo está dentro de la carpeta Concerns, por eso necesitamos incluir lo siguiente
    extend ActiveSupport::Concern

    #Método para permitir el paso del parámetro 'name' al momento de crear un usario
    included do
        before_action :configure_permitted_parameters, if: :devise_controller?
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end