$.UsersSearch = function (el) {
  this.$el = $(el);
  this.$input = this.$el.find('input');
  this.$ul = $('.users');

  this.$input.on('input', this.handleInput.bind(this));
};

$.UsersSearch.prototype.handleInput = function (event) {
  event.preventDefault();
  $.ajax({
    url: '/users/search',
    type:  'GET',
    dataType: 'json',
    data: this.$input.serializeJSON(),

    success: this.renderResults.bind(this)
  });
};

$.UsersSearch.prototype.renderResults = function( users ){
  this.$ul.empty();

  for(var i = 0; i < users.length; i++){
    var user = users[i].username
    var id = users[i].id

    var $li = $('<li></li>');

    var $link = $( '<a></a>' );
    $link.attr( "href", '/users/' + id )
    $link.text(user);


    var $button = $('<button></button>');

    $li.append($link);
    $li.append($button);
    this.$ul.append($li);

    $button.followToggle(users[i]);
  }

}

$.fn.usersSearch = function ( usersArray ) {
  return this.each(function () {
    new $.UsersSearch(this);
  });
};

$(function () {
  $(".users-search").usersSearch();
});
