module Events
  class IndexPageRepository
    attr_reader :event_model

    def initialize(event_model)
      @event_model = event_model
    end

    def paginate(page)
      event_model.page(page)
    end
  end
end
