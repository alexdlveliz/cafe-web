class EventsController < ApplicationController
  layout "event"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @events_items = Event.all
    @page_title = "Cafe Web | Eventos"
    #@events_items = Event.published -> Si se quiere mostrar solo los eventos públicos
    #@events_items = Event.draft -> Si se quiere mostrar solo los eventos privados
  end

  def new
    @events_item = Event.new
  end

  def create
    @events_item = Event.new(events_params)

    respond_to do |format|
      if @events_item.save
        format.html { redirect_to events_path, notice: 'El evento fue creado exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @events_item = Event.friendly.find(params[:id])
  end

  def update
    @events_item = Event.friendly.find(params[:id])
    respond_to do |format|
      if @events_item.update(events_params)
        format.html { redirect_to events_path, notice: 'El evento fue actualizado correctamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @page_title = Event.friendly.find(params[:id]).name
    @events_item = Event.friendly.find(params[:id])
  end

  def destroy
    @events_item = Event.friendly.find(params[:id])

    @events_item.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'El evento fue eliminado correctamente' }
    end
  end

  def toggle_status
    @events_item = Event.friendly.find(params[:id])

    if @events_item.draft?
      @events_item.published!
    elsif @events_item.published?
      @events_item.draft!
    end

    redirect_to events_url, notice: "El evento fue actualizado"
  end

  def events_params
    params.require(:event).permit(:name, 
                                :description, 
                                :main_image,
                                :thumb_image,
                                :date_event,
                                :slug,
                                :status
                              )
  end
end

