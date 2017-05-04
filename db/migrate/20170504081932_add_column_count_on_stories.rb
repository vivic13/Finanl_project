class AddColumnCountOnStories < ActiveRecord::Migration[5.0]
  def change
  	add_column :stories, :comments_count, :integer, :default => 0, :null => false
  end
end
