require "rails_helper"

RSpec.describe User do
  context 'There is User model' do
    it { expect(User.all).to be_truthy }
  end
end
