Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
  this.$pokeDetail.empty();
  this.$toyDetail.empty();

  var $pokeDiv = $('<div>');
  $pokeDiv.addClass('detail');

  $pokeDiv.append($("<h1>" + pokemon.get('name') + "</h1>"));

  $pokeDiv.append($('<img src=' + pokemon.get('image_url') + '>'));

  $ul = $('<ul></ul>');
  $ul.append($('<li> Pokemon type: ' + pokemon.get("poke_type") + "</li>"));
  $ul.append($('<li> Attack Strength: ' + pokemon.get("attack") + "</li>"));
  $ul.append($('<li> Defense Strength: ' + pokemon.get("defense") + "</li>"));
  $ul.append($('<li> Moves: ' + pokemon.get("moves") + "</li>"));

  $pokeDiv.append($ul);

  this.$pokeDetail.append($pokeDiv);

  var $toyDiv = $('<div>').addClass("pokemon-toys");
  $toyDiv.append($("<h2> Pokemon's Toys </h2>"));
  var $toys = $("<ul>").addClass("toy-list");
  $toyDiv.append($toys);
  this.$pokeDetail.append($toyDiv);

  var that = this;
  pokemon.fetch({
    success: function(){
      pokemon.toys().each(that.addToyToList.bind(that))
    }
  });
};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
  var targetId = $(event.target).data("id");
  var pokemon = this.pokes.get(targetId);
  this.renderPokemonDetail(pokemon);
};
