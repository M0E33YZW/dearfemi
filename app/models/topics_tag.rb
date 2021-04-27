class TopicsTag
  include ActiveModel::Model
  attr_accessor :user_id, :title, :text, :tagname, :image

  with_options presence: true do
    validates :title
    validates :text
  end

  def save
    topic = Topic.create(user_id: user_id, title: title, text: text, image: image)
    tag = Tag.where(tagname: tagname).first_or_initialize
    tag.save

    TopicTagRelation.create(topic_id: topic.id, tag_id: tag.id)
  end
end