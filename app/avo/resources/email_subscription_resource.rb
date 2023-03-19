# frozen_string_literal: true

class EmailSubscriptionResource < Avo::BaseResource
  self.title = :uuid
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :uuid, as: :text
  field :email, as: :text
  # add fields here
end
