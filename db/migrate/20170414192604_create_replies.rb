class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
