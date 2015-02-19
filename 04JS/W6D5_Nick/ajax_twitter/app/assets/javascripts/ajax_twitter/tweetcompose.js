$.TweetCompose = function (el) {
  this.$el = $(el);
  this.$inputs = this.$el.find(':input');
  this.$el.on("submit", this.submit.bind(this));
  this.$el.find("textarea").on("input", this.count.bind(this))
};

$.TweetCompose.prototype.count = function(event){
  event.preventDefault();
  var $strong = this.$el.find('.chars-left');
  var charleft = 140 - event.currentTarget.textLength;
  $strong.text(charleft + " characters remaining");
}

$.TweetCompose.prototype.submit = function (event) {
  event.preventDefault();
  var data = this.$el.serializeJSON();

  this.$inputs.prop("disabled", true);

  $.ajax({
    url: "/tweets",
    type: "POST",
    dataType: "json",
    data: data,
    success: this.handleSuccess.bind(this),
    error: function(){
      console.log("wtf!")
    }
  })
};

$.TweetCompose.prototype.handleSuccess = function(data){
  this.$inputs.prop("disabled", false);
  this.clearInput();

  var feed =  $( this.$el.data('tweets-url') );

  var poster = data.user.username;
  var mentioned = data.mentions[0].user.username;
  var content = data.content;
  var time = data.created_at;

  var tweet = content + "--" + poster + "--" + time;

  var lineItem = $ ('<li></li>');

  var subUl = $ ('<ul></ul>');
  var subLineItem = $ ('<li></li>');
  subLineItem.text(mentioned);


  lineItem.text(tweet);
  subUl.append(subLineItem);
  lineItem.append(subUl);
  
  feed.prepend(lineItem);
};

$.TweetCompose.prototype.clearInput = function(){
  this.$el.find('textarea').val("");
  this.$el.find('select').attr('selected', false);
};

$.fn.tweetCompose = function () {
  return this.each(function () {
    new $.TweetCompose(this);
  });
};

$(function () {
  $(".tweet-compose").tweetCompose();
});
