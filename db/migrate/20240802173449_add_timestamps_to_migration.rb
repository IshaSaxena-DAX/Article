class AddTimestampsToMigration < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :created, :datetime #articles= table name , created = attribute, datetime= datatype
    add_column :articles, :updated, :datetime
  end
end
