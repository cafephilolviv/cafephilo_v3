# frozen_string_literal: true

class Admin::EventsController < ApplicationController
  def index
    authenticate_user!

    events = Events::IndexPageRepository.new(Event).paginate(params[:page])
    render :index, locals: { events: events }, layout: "admin"
  end

  def new
    authenticate_user!
    event = Event.new
    render :new, locals: { event: event }, layout: "admin"
  end

  def show
    authenticate_user!
    event = find_event

    render :show, locals: { event: event }, layout: "admin"
  end

  def create
    authenticate_user!
    event = Event.new(permited_params)
    return redirect_to admin_events_path if event.save!

    render :new, layout: "admin"
  end

  def edit
    authenticate_user!
    event = find_event

    render :edit, locals: { event: event }, layout: "admin"
  end

  def update
    authenticate_user!
    event = find_event
    if event.update!(permited_params)
      event.image.attach(permited_params[:image])
      redirect_to admin_events_path
    else
      render :edit, layout: "admin"
    end
  end

  def delete
    authenticate_user!
  end

  private
    def find_event
      Event.find(params[:id])
    end

    def permited_params
      params
        .require(:event)
        .permit(:title, :description, :date, :image)
    end
end
