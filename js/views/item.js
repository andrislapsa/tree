// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  App.Views.Item = (function(_super) {
    __extends(Item, _super);

    function Item() {
      this.render = __bind(this.render, this);
      return Item.__super__.constructor.apply(this, arguments);
    }

    Item.prototype.tagName = 'li';

    Item.prototype.initialize = function() {
      return this.model.bind('change', this.render);
    };

    Item.prototype.render = function() {
      $(this.el).html("heisā " + (this.model.get('title')) + " hopsā");
      return this;
    };

    return Item;

  })(Backbone.View);

}).call(this);
