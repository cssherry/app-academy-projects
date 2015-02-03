# write some jbuilder to return some json about a board
# it should include the board
#  - its lists
#    - the cards for each list
json.extract! @board, :id, :title, :user_id, :created_at, :updated_at
json.lists do
  # partial path is searched from the views folder
  json.array! @board.lists, partial: 'api/lists/list', as: :list
end
