class AddColumnCommentToUserObjetivos < ActiveRecord::Migration
  def change
    add_column :user_objetivos, :comment, :text
  end
end
