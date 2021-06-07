require 'rails_helper'

RSpec.describe TopicTagRelation, type: :model do
    describe 'トピックの投稿' do
      before do
        @user = FactoryBot.create(:user)
        @tag = FactoryBot.create(:tag)
        @topic = FactoryBot.create(:topic)
        @topic_tag_relation = FactoryBot.build(:topic_tag_relation, topic_id: @topic.id, tag_id: @tag_id)
        sleep 1
      end
  
      context 'トピックが投稿できるとき' do
        it '全ての値が正しく入力されていれば投稿できる' do
          expect(@topic).to be_valid
        end
        it '画像を添付しなくても投稿できる' do
          @topic.image = nil
          expect(@topic).to be_valid
        end
      end
  
      context 'トピックの投稿ができないとき' do
        it 'userが紐付いていないと投稿できない' do
          @topic.user = nil
          @topic.valid?
          expect(@topic.errors.full_messages).to include('Userを入力してください')
        end
      end
    end
  end
  