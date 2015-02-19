Pokedex.Views = {}

Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
    "click li":"selectPokemonFromList"
  },

  // initialize: function () {
  //   this.collection = new Pokedex.Collections.Pokemon()
  // },

  addPokemonToList: function (pokemon) {
    var content = JST['pokemonListItem']({pokemon: pokemon});
    this.$el.prepend(content);
  },

  refreshPokemon: function (options) {
    var that = this;
    this.collection.fetch({
      success: function() {
        that.render();
        // options.success && options.success();
        if (options.success){
          options.success();
        }
      }
    })
  },

  render: function () {
    this.$el.empty();
    this.collection.each(this.addPokemonToList.bind(this));
  },

  selectPokemonFromList: function (event) {
    // Phase IB
    var $target = $(event.currentTarget);

    var pokeId = $target.data('id');

    // var pokemon = this.collection.get(pokeId);

    //new views takes default options like model, collection, it will initialize with those values
    // var detail = new Pokedex.Views.PokemonDetail({model: pokemon, collection: this.collection});
    // detail.refreshPokemon();
    Backbone.history.navigate('pokemon/' + pokeId, { trigger: true });
  }
});

Pokedex.Views.PokemonDetail = Backbone.View.extend({
  events: {
    "click li" : "selectToyFromList"
  },

  refreshPokemon: function (options) {
    var that = this;
    this.model.fetch({
      // need to bind or else won't know what "this" is
      success:function(){
        that.render();
        if (options.success) {
          options.success.call();
        }
      }
    })
  },

  render: function () {
    var content = JST['pokemonDetail']({pokemon: this.model});
    this.$el.html(content);

    // .$ is shorthand for this.$el.find()
    var toyList = this.$(".toys");

    this.model.toys().each(function(toy){
      toyList.append(JST["toyListItem"]({toy: toy}));
    })
  },

  selectToyFromList: function (event) {
    var $target = $(event.target);

    var toyId = $target.data('id');
    // var toy = this.model.toys().get(toyId);

    // replaces text:
    //   content = escapes html
    //   html = include html code
    // add to text:
    //   append = adds to end of element
    //   prepend = adds to the beginning of element

    Backbone.history.navigate("pokemon/" + this.model.id + "/toys/" + toyId, { trigger: true });

    // var detail = new Pokedex.Views.ToyDetail({model: toy, collection: this.collection})
    // detail.render();
  }
});

Pokedex.Views.ToyDetail = Backbone.View.extend({
  events: {
    "change .detail select": "changePokemon"
  },

  render: function () {
    // this.$el = xyz will kill all event handlers
    this.$el.append(JST['toyDetail']({toy: this.model, pokes: this.collection}));
  },

  changePokemon: function(event){
    var that = this;
    var pokemon = this.collection.get(this.model.get("pokemon_id"));
    var newId = $(event.currentTarget).val();
    this.model.set("pokemon_id", newId);
    this.model.save({}, {
      success: function() {
        pokemon.toys().remove(that.model);
        Backbone.history.navigate("pokemon/" + newId + "/toys/" + that.model.id, {trigger: true});
      }
    })
  }
});
