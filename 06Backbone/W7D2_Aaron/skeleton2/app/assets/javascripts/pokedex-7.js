Pokedex.Views = (Pokedex.Views || {});

Pokedex.Views.PokemonForm = Backbone.View.extend({
  events: {
    "submit" : "savePokemon"
  },

  render: function () {
    var content = JST["pokemonForm"]({pokemon: this.model});
    this.$el.html(content);
  },

  savePokemon: function (event) {
    event.preventDefault();
    var pokeAttrs = ($(event.target).serializeJSON())['pokemon'];
    this.createPokemon(pokeAttrs);
  },

  createPokemon: function (attrs, callback) {
    var pokemon = new Pokedex.Models.Pokemon(attrs);
    var that = this;
    var id = pokemon.id;

    pokemon.save(attrs, {
      success: (function() {
        if (!id){
          that.collection.add(pokemon);
        }
        else {
          var editedPokemon = $(".pokemon-index li[data-id='" + id + "']");
          editedPokemon.remove()
        }
        var content = JST['pokemonListItem']({pokemon: pokemon});
        $('.pokemon-list > div').prepend(content);

        Backbone.history.navigate("pokemon/" + pokemon.id, {trigger: true});
        that.render();
      }).bind(this)
    });

    return pokemon;
  },
});

//Todo:
//Sort pokemon list by date updated
//refresh pokemon details after updating details
