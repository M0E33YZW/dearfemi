module HashtagMethods
  extend ActiveSupport::Concern

  def extract_hashtag(caption)
    return if caption.blank?

    caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  end

  def save_hashtag(hashtag_array, post_instance)
    return if hashtag_array.blank?

    hashtag_array.uniq.each do |hashtag|
      tag = Tag.find_or_create_by(tagname: hashtag.downcase.delete('#'))

      post_hashtag = TopicTagRelation.new
      post_hashtag.topic_id = post_instance.id
      post_hashtag.tag_id = tag.id
      post_hashtag.save!
    end
  end

  def creating_structures(posts: '', post_hashtags: '', hashtags: '')
    array = []
    posts.each do |post|
      hashtag = []
      post_hash = post.attributes
      related_hashtag_records = post_hashtags.select { |ph| ph.post_id == post.id }
      related_hashtag_records.each do |record|
        hashtag << hashtags.detect { |hashtag| hashtag.id == record.hashtag_id }
      end
      post_hash['hashtags'] = hashtag
      array << post_hash
    end
    array
  end

  def delete_records_related_to_hashtag(topic)
    relationship_records = TopicTagRelation.where(topic_id: topic.id)
    if relationship_records
      relationship_records.each do |record|
        record.destroy
      end
    end
    all_hashtags = Tag.all
    all_related_records = TopicTagRelation.all
    all_hashtags.each do |hashtag|
      hashtag.destroy if all_related_records.none? { |record| hashtag.id == record.topic_id }
    end
  end
end
