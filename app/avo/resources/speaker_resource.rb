# frozen_string_literal: true

class SpeakerResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = lambda do
    scope.ransack(
      id_eq: params[:q], first_name_cont: params[:q], last_name_cont: params[:q], m: 'or'
    ).result(distinct: false)
  end

  field :id, as: :id, hide_on: [:index]
  field :first_name, as: :text
  field :last_name, as: :text
end
