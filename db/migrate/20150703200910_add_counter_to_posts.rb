class AddCounterToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :send_count, :integer,:default => 0
  end
end
