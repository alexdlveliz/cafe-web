module ApplicationHelper
    #Método para mostrar el login o logout según sea el usuario que está usando la aplicación
    def login_helper
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path) + 
            "<br>".html_safe + 
            (link_to "Log in", new_user_session_path)
        else
            link_to "Logout", destroy_user_session_path, method: :delete
        end
    end

    #Método helper para agregar el footer a través de la gema 'tello_view_tool
    def copyright_generator
        TelloViewTool::Renderer.copyright "MultiTorial", "Todos los derechos reservados"
    end
end
