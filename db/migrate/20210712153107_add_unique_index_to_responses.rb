class AddUniqueIndexToResponses < ActiveRecord::Migration[6.1]
  def change
    remove_index :responses,:user_id
    remove_index :responses,:answer_id 

    add_index :responses,[:user_id,:answer_id],unique:true
  end
end
