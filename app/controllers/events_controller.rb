class EventsController < ApplicationController
  def index
    events = Event.all
    render :index, locals: { events: events }
  end
end
