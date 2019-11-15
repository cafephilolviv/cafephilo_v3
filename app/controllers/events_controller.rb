# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    events ||= Events::IndexPageRepository.new(Event).paginate(params[:page])

    render :index, locals: { events: events }
  end
end
