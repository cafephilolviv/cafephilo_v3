class EventsController < ApplicationController
  def index
    require 'pry'; binding.pry # FIXME <<<<<<<<<<<<<<<<<<<< REMOVE
    @events = Event.all
  end
end
