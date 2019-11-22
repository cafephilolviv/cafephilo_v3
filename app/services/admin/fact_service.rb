# frozen_string_literal: true

module Admin
  module FactService
    module_function

    def about_page_facts(fact)
      fact.all
    end
  end
end
