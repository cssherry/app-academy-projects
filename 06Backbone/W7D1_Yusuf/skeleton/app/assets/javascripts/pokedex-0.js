window.Pokedex = (window.Pokedex || {});
window.Pokedex.Models = {};
window.Pokedex.Collections = {};

Pokedex.Models.Pokemon = Backbone.Model.extend({
  urlRoot: '/pokemon',

  parse: function(jsonResp) { //Backbone objects defined within the object
    if (jsonResp.toys) {
      this.toys().set(jsonResp.toys);
      delete jsonResp.toys;
    }
    return jsonResp;
  },

  toys: function(){
    if (this._toys === undefined) {
      this._toys = new Pokedex.Collections.PokemonToys([], {
      });
    }
    return this._toys;
  }
});

Pokedex.Models.Toy = Backbone.Model.extend({
  urlRoot: '/toys'
});

Pokedex.Collections.Pokemon = Backbone.Collection.extend({
  url: '/pokemon',
  model: Pokedex.Models.Pokemon
});

Pokedex.Collections.PokemonToys = Backbone.Collection.extend({
  urlRoot: '/pokemon',
  model: Pokedex.Models.Toy,
});

window.Pokedex.Test = {
  testShow: function (id) {
    var pokemon = new Pokedex.Models.Pokemon({ id: id });
    pokemon.fetch({
      success: function () {
        console.log(pokemon.toJSON());
      }
    });
  },

  testIndex: function () {
    var pokemon = new Pokedex.Collections.Pokemon();
    pokemon.fetch({
      success: function () {
        console.log(pokemon.toJSON());
      }
    });
  }
};

window.Pokedex.RootView = function ($el) {
  this.$el = $el;
  this.pokes = new Pokedex.Collections.Pokemon();
  this.$pokeList = this.$el.find('.pokemon-list');
  this.$pokeDetail = this.$el.find('.pokemon-detail');
  this.$newPoke = this.$el.find('.new-pokemon');
  this.$toyDetail = this.$el.find('.toy-detail');

  // Click handlers go here.
  this.$el.on("click", ".poke-list-item", this.selectPokemonFromList.bind(this))
  this.$el.on("click", ".toy-list-item", this.selectToyFromList.bind(this))
  this.$newPoke.on("submit", this.submitPokemonForm.bind(this))
};

$(function() {
  var $rootEl = $('#pokedex');
	window.Pokedex.rootView = new Pokedex.RootView($rootEl);
  window.Pokedex.rootView.refreshPokemon();
});
