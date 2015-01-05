class User < ActiveRecord::Base
  has_many(
    :watch_lists,
    class_name: 'WatchList',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :watch_list_items,
    through: :watch_lists,
    source: :watch_list_items
  )

  has_many(
    :watched_companies,
    through: :watch_list_items,
    source: :company
  )
end
