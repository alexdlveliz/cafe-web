class EventsController < ApplicationController
    def index
        @events_item = Event.all
    end    
end
