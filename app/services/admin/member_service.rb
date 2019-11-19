# frozen_string_literal: true

module Admin
  module MemberService
    module_function

    def about_page_members(member)
      member.all
    end
  end
end
