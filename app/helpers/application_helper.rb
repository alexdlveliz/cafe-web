module ApplicationHelper
    #Método para mostrar el login o logout según sea el usuario que está usando la aplicación
    def login_helper style = ''
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: style) + 
            " ".html_safe + 
            (link_to "Log in", new_user_session_path, class: style)
        else
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    #Método helper para agregar el footer a través de la gema 'tello_view_tool'
    def copyright_generator
        TelloViewTool::Renderer.copyright "MultiTorial", "Todos los derechos reservados"
    end

    #Hash para el navbar. Este hash se va a iterar en el método 'nav_helper' para colocdar en pantalla
    #todas las rutas existentes
    def nav_items
        [
            {
                url: root_path,
                title: 'Home'
            },
            {
                url: products_path,
                title: 'Menú'
            },
            {
                url: events_path,
                title: 'Eventos'
            },
            {
                url: sells_path,
                title: 'Venta'
            },
            {
                url: orders_path,
                title: 'Órdenes'
            },
        ]
    end

    #Método para el navbar.
        #style es para los estilos en CSS
        #tag_type es para la etiqueta de HTML
    def nav_helper style, tag_type
        nav_links = ''
        nav_items.each do |item|
            nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
        end
        nav_links.html_safe
    end

    #Método para agregar la clase 'active' al css
    def active? path 
        #Retornar 'active' si la current_path es igual al parámetro 'path'
        "active" if current_page? path 
    end
end
