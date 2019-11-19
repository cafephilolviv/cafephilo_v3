# frozen_string_literal: true

class Admin::DashboardController < ApplicationController
  def index
    authenticate_user!

    render :index, layout: "admin"
  end
end
