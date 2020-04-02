# frozen_string_literal: true

module Events
  class IndexPageRepository
    attr_reader :event_model

    def initialize(event_model)
      @event_model = event_model
    end

    def paginate_admin(page)
      event_model.page(page)
    end

    def paginate(page)
      event_model.published.page(page)
    end
  end
end
