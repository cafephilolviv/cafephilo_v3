# frozen_string_literal: true

class Admin::AboutController < ApplicationController
  def index
    authenticate_user!

    members = Admin::MemberService.about_page_members(Member)
    facts = Admin::FactService.about_page_facts(Fact)

    render 'index', locals: { members: members, facts: facts }, layout: 'admin'
  end
end
