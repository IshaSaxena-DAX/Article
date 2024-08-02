class AddTimestampsToMigration < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :created, :datetime
    add_column :articles, :updated, :datetime
  end
end
