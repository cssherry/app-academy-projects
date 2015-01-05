class Company < ActiveRecord::Base
  has_one(
    :board,
    class_name: 'Board',
    foreign_key: :company_id,
    primary_key: :id
  )

  belongs_to(
    :exchange,
    class_name: 'Exchange',
    foreign_key: :exchange_id,
    primary_key: :id
  )

  has_many(
    :prices,
    class_name: 'Price',
    foreign_key: :company_id,
    primary_key: :id
  )

  has_many(
    :watch_list_items,
    class_name: 'WatchListItem',
    foreign_key: :company_id,
    primary_key: :id
  )

  has_many(
    :watch_lists,
    through: :watch_list_items,
    source: :watch_list
  )

  has_many(
    :watchers,
    through: :watch_lists,
    source: :watcher
  )
end
