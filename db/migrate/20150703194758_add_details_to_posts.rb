class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :send_date, :date
  end
end
