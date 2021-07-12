class AddColumnToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :question_id, :integer,null:false
    
    remove_index :responses,[:user_id,:answer_id]
    add_index :responses,[:user_id,:answer_id,:question_id],unique:true
  end
end
