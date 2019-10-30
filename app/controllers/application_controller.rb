class ApplicationController < ActionController::Base
    #Se hace el llamado a los siguientes concerns
    #Estos archivos están guardados en app/controllers/concerns
    include DeviseWhitelist
    include CurrentUserConcern
    include DefaultPageContent

end