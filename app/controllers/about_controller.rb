# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    members = Member.all
    facts = Fact.all
    render :index, locals: { members: members, facts: facts }
  end
end
