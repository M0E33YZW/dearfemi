class CreateTopicTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_tag_relations do |t|

      t.timestamps
    end
  end
end
