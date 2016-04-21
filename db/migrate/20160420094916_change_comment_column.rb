class ChangeCommentColumn < ActiveRecord::Migration
  def change
  	change_column :reviews, :comment, :text
  end
end
