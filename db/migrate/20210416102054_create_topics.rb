class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.references :user,  foreign_key: true
      t.string     :title, null: false
      t.text       :text,  null: false
      t.timestamps
    end
  end
end
