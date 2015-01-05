class WatchList < ActiveRecord::Base
  belongs_to(
    :watcher,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :watch_list_items,
    class_name: 'WatchListItem',
    foreign_key: :watch_list_id,
    primary_key: :id
  )
end
