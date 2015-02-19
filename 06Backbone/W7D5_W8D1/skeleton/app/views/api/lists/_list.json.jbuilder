json.extract! list, :id, :title, :ord, :board_id, :created_at, :updated_at
json.cards do
  json.array! list.cards, partial: 'api/cards/card', as: :card
end
