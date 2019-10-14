module ApplicationHelper
    def login_helper
        #Condición para mostrar el login o el logout
        if current_user.is_a?(User)
            link_to "Logout", destroy_user_session_path, method: :delete
        else
            (link_to "Register", new_user_registration_path) + 
            "<br>".html_safe + 
            (link_to "Log in", new_user_session_path)
        end
    end
end
