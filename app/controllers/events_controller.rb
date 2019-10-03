class EventsController < ApplicationController
    def index
        @events_items = Event.all
    end

    def new
        @events_item = Event.new
    end

    def create
        @events_item = Event.new(params.require(:event).permit(:name, :description))
    
        respond_to do |format|
          if @events_item.save
            format.html { redirect_to events_path, notice: 'El evento fue creado exitosamente.' }
          else
            format.html { render :new }
          end
        end
    end

    def edit
        @events_item = Event.find(params[:id])
    end

    def update
        @events_item = Event.find(params[:id])
        respond_to do |format|
          if @events_item.update(params.require(:event).permit(:name, :description))
            format.html { redirect_to events_path, notice: 'El evento fue actualizado correctamente.' }
          else
            format.html { render :edit }
          end
        end
    end
end
