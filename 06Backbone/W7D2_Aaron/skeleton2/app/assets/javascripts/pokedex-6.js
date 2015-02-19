Pokedex.Router = Backbone.Router.extend({
  routes: {
    '': 'pokemonIndex',
    'pokemon/:id': 'pokemonDetail',
    'pokemon/:pokemonId/toys/:toyId': "toyDetail"
  },

  pokemonDetail: function (id, callback) {
    var that = this;
    if (!this._pokemonIndex) {
      this.pokemonIndex(function(){
        that.pokemonDetail(id, callback);
      })
    } else {
      var pokemon = this._pokemonIndex.collection.get(id);
      this._pokemonDetail = new Pokedex.Views.PokemonDetail({model: pokemon, collection: this._pokemonIndex.collection});
      $("#pokedex .pokemon-detail").html(this._pokemonDetail.$el);
      $("#pokedex .toy-detail").empty();
      this._pokemonDetail.refreshPokemon({success: callback});
      this.pokemonForm();
    }
  },

  pokemonIndex: function (callback) {
    var pokemonIndex = new Pokedex.Views.PokemonIndex({
      collection: new Pokedex.Collections.Pokemon()
    });
    this._pokemonIndex = pokemonIndex;
    $("#pokedex .pokemon-list").html(pokemonIndex.$el);
    pokemonIndex.refreshPokemon({success: callback});
    this.pokemonForm();
  },

  toyDetail: function (pokemonId, toyId) {
    var that = this;
    if (!this._pokemonDetail || (this._pokemonDetail.model.id !== parseInt(pokemonId))){
      this.pokemonDetail(pokemonId, function(){
        that.toyDetail(pokemonId, toyId);
      })
    } else {
      var toy = this._pokemonDetail.model.toys().get(toyId);
      var detail = new Pokedex.Views.ToyDetail({model: toy, collection: this._pokemonIndex.collection});
      detail.render();
      $("#pokedex .toy-detail").empty();
      $("#pokedex .toy-detail").append(detail.$el);
    }
  },

  pokemonForm: function () {
    var pokemon = this._pokemonDetail ? this._pokemonDetail.model : new Pokedex.Models.Pokemon({moves: ["",""]})
    var form = new Pokedex.Views.PokemonForm({model: pokemon, collection: this._pokemonIndex.collection});
    form.render();
    $('#pokedex .pokemon-form').html(form.$el);
  }
});


$(function () {
  new Pokedex.Router();
  Backbone.history.start();
});
