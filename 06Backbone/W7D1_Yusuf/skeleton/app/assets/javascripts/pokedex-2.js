Pokedex.RootView.prototype.addToyToList = function (toy) {
  var $toys = $(".toy-list");

  var $li = $('<li class="toy-list-item"></li>');
  $li.data("toy_id", toy.get('id'))
  $li.data("pokemon_id", toy.get('pokemon_id'))
  $li.text(toy.get("name") + " (" + toy.get("happiness") + "): $" + toy.get("price"));
  $toys.append($li);
};

Pokedex.RootView.prototype.renderToyDetail = function (toy) {
  if (this.$toyDetail.find(":contains('" + toy.get("name")+ "')")[0] === undefined) {
    var $toyDiv = $('<div>');
    $toyDiv.addClass('detail');

    $toyDiv.append($("<h1>" + toy.get('name') + "</h1>"));

    $toyDiv.append($('<img src=' + toy.get('image_url') + '>'));

    $ul = $('<ul></ul>');
    $ul.append($('<li> Price: ' + toy.get("price") + "</li>"));
    $ul.append($('<li> Happiness: ' + toy.get("happiness") + "</li>"));

    $toyDiv.append($ul);

    this.$toyDetail.append($toyDiv);
  }

  // $('.toy-detail').append($toyDiv);
};

Pokedex.RootView.prototype.selectToyFromList = function (event) {
  var pokemonId = $(event.target).data("pokemon_id");
  var toyId = $(event.target).data("toy_id");
  var pokemon = this.pokes.get(pokemonId);
  var that = this;
  pokemon.fetch({
    success: function(){
      var toy = pokemon.toys().get(toyId);
      that.renderToyDetail(toy);
    }
  })
};
