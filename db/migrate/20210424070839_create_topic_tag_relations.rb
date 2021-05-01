class CreateTopicTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_tag_relations do |t|
      t.references :topic, foreign_key: true
      t.references :tag,   foreign_key: true
      t.timestamps
    end
    add_index :topic_tag_relations, [:topic_id, :tag_id]
  end
end
