require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port:3000,
  path: '/users/8/comments',
  # query_values: {
  #     'some_category[a]' => 'other value',
  #     'some_category[a_second_key]' => 'yet another value',
  #     'some_category[inner_inner_hash][key]' => 'value',
  #     'something_else' => 'aaahhhhh'
  # }
).to_s

puts RestClient.post(url, {comment: {title: "A comment on user 8"}})
