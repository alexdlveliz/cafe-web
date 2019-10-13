module DefaultPageContent
    #Este archivo está dentro de la carpeta Concerns, por eso necesitamos incluir lo siguiente
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    #Definir el título de la página que va a aparecer en el navegador
    def set_page_defaults
        @page_title = "Cafe Web"
        @seo_keywords = "Cafe Web Xela"
    end
end
