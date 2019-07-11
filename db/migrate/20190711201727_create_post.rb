class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :post do |t|
      t.string :title
      t.string :maintext
      t.string :user_ID
      t.string :creator
    end
  end
end
