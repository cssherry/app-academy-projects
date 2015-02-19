Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {
  var $li = $('<li></li>');
  $li.data("id", pokemon.get("id")) //data is hidden in html
  $li.addClass('poke-list-item')
  $li.text(pokemon.get('name') + ' (' + pokemon.get('poke_type') + ')');
  this.$pokeList.prepend($li);
};

Pokedex.RootView.prototype.refreshPokemon = function (callback) {
  var that = this;
  this.pokes.fetch({
    success: function(results){
      results.each(that.addPokemonToList.bind(that))
    },
  })
};
