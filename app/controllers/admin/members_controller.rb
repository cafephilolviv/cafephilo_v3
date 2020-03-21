# frozen_string_literal: true

class Admin::MembersController < ApplicationController
  def index
    authenticate_user!
    member = Member.all
  end

  def edit
    authenticate_user!

    member = find_member
    render :edit, locals: { member: member }, layout: "admin"
  end

  def member_params
    params.require(:member)
      .permit(:first_name, :last_name, :position, :description, :image)
  end

  def find_member
    Member.find(params[:id])
  end
end
