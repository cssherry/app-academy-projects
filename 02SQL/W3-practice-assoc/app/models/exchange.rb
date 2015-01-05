class Exchange < ActiveRecord::Base
  has_many(
    :companies,
    class_name: 'Company',
    foreign_key: :exchange_id,
    primary_key: :id
  )
end
