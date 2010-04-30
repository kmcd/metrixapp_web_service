class EventAddAccountCode < ActiveRecord::Migration
  def self.up
    add_column :events, :account_code, :string
  end

  def self.down
    remove_column :events, :account_code
  end
end
