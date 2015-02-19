$.Tabs = function (el) {
  this.$el = $(el);
  this.$contentTabs      = $(this.$el.attr("data-content-tabs"));
  this.$activeContentTab = this.$contentTabs.find(".active");
  this.$activeTab        = this.$el.find(".active"); // li.active

  this.$el.children().on("click", this.clickTab.bind(this));
};

$.Tabs.prototype.clickTab = function (){
  this.$activeTab.removeClass("active");
  this.$activeContentTab.removeClass("active").addClass("transitioning");
  this.$activeTab = $(event.currentTarget);
  this.$activeTab.addClass("active");

  var that = this
  this.$activeContentTab.one("transitionend", function(){
    that.$activeContentTab.removeClass("transitioning");

    var activeId = that.$activeTab.find($('a')).attr('href');
    that.$activeContentTab = that.$contentTabs.find(activeId);

    that.$activeContentTab.addClass("transitioning");
    setTimeout(function(){that.$activeContentTab.toggleClass("transitioning active");})
  });


}

$.fn.tabs = function () {
  return this.each(function () {
    new $.Tabs(this);
  });
};
