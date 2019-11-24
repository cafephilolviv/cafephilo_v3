class AddUuidToEmailSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :email_subscriptions, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
