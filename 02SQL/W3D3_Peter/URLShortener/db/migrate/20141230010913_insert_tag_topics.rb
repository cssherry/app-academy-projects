class InsertTagTopics < ActiveRecord::Migration
  def up
    TagTopic.create!(tag: 'news')
    TagTopic.create!(tag: 'music')
    TagTopic.create!(tag: 'videos')
    TagTopic.create!(tag: 'programming')
  end

  def down
    TagTopic.delete_all("tag IN ('news', 'music', 'videos', 'programming')")
  end
end
