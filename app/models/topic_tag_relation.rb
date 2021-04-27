class TopicTagRelation < ApplicationRecord
  belongs_to :topic
  belongs_to :tag

  with_options presence: true do
    validates :topic_id
    validates :tag_id
  end  
end
