Pokedex.RootView.prototype.createPokemon = function (attrs, callback) {
  var newPokemon = new Pokedex.Models.Pokemon(attrs);
  var that = this;
  newPokemon.save({}, {
    success: function(){
      that.pokes.add(newPokemon);
      callback(newPokemon);
    } //need to pass in blank attributes hash because otherwise callback becomes attribute
  });
};

Pokedex.RootView.prototype.submitPokemonForm = function (event) {
  event.preventDefault();
  var pokeAttrs = $(event.currentTarget).serializeJSON()['pokemon'];
  this.createPokemon(pokeAttrs, this.addPokemonToList.bind(this));
  this.$el.find('input').val('');
  this.$el.find('select').val('')
};
