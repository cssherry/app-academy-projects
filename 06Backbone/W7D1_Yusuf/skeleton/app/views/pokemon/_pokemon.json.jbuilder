json.extract!(pokemon, :id, :attack, :defense, :image_url, :moves, :name, :poke_type)

if display_toys # This is in ruby, no ===
  json.toys do
    json.array! pokemon.toys, partial: 'toys/toy', as: :toy
  end
end
