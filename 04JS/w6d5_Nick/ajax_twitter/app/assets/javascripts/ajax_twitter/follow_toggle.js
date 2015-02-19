$.FollowToggle = function (el, user) {
  this.$el = $(el);
  this.userId = this.$el.data("user-id") || user.id ;
  if (typeof user === 'undefined'){
    this.followState = this.$el.data("initial-follow-state");
  } else {
    this.followState = user.followed;
  }

  this.followState = this.followState ? "followed" : "unfollowed";

  this.render();
  this.$el.on('click', this.handleClick.bind(this));
};

$.FollowToggle.prototype.render = function () {
  // switch this.followState {
  //   case "followed" || "following"
  //   set text
  //   break;
  //   case 2
  // }
  if (this.followState === "followed"){
    this.$el.text("Unfollow!");
  } else if (this.followState === "unfollowed"){
    this.$el.text("Follow!");
  } else if (this.followState === "following"){
    this.$el.text("Unfollow!");
    this.$el.prop("disabled", true);
  } else if (this.followState === "unfollowing"){
    this.$el.text("Follow!");
    this.$el.prop("disabled", true);
  }
};

$.FollowToggle.prototype.handleClick = function(event){
  event.preventDefault();
  var url = '/users/' + this.userId + '/follow';
  var that = this;

  var ajaxOptions = {};

  // if (this.followState = "unfollowed") {
  //   ajaxOptions.type = "POST";
  // }

  if (this.followState == "unfollowed"){
    that.followState = "following";
    that.render();

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json',

      success: function(){
        that.followState = "followed";
        that.$el.prop("disabled", false);
        that.render();
      },

      error: function(){
        console.log("Something went wrong!")
        that.followState = "unfollowed";
        that.$el.prop("disabled", false);
        that.render();
      }
    });
  } else {
    that.followState = "unfollowing";
    that.render();

    $.ajax({
      url: url,
      type: 'DELETE',
      dataType: 'json',
      success: function(){
        that.followState = "unfollowed";
        that.$el.prop("disabled", false);
        that.render();
      },
      error: function(){
        console.log("Something went wrong!")
        that.followState = "followed";
        that.$el.prop("disabled", false);
        that.render();
      }}
    )
  }

};

$.fn.followToggle = function (user) {
  return this.each(function () {
    new $.FollowToggle(this, user);
  });
};

//Why would you run this on every page?
$(function () {
  $("button.follow-toggle").followToggle();
});
