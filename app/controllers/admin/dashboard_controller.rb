# frozen_string_literal: true

class Admin::DashboardController < ApplicationController
  def index
    authenticate_user!

    events = Events::IndexPageRepository.new(Event).paginate(params[:page])
    render :index, locals: { events: events }, layout: "admin"
  end
end
