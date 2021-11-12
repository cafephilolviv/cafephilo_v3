# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events ||= Events::IndexPageRepository.new(Event).paginate(params[:page])

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: 'events', formats: [:html]), pagination: view_context.paginate(@events) }
      }
    end
  end
end
