class Price < ActiveRecord::Base
  belongs_to(
    :company,
    class_name: 'Company',
    foreign_key: :company_id,
    primary_key: :id
  )
end
