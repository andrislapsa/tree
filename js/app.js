// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.App = {
    Models: {},
    Collections: {},
    Views: {}
  };

  jQuery(function() {
    var MainView;
    App.Views.MainView = (function(_super) {
      __extends(MainView, _super);

      function MainView() {
        this.renderItem = __bind(this.renderItem, this);
        return MainView.__super__.constructor.apply(this, arguments);
      }

      MainView.prototype.el = $('body');

      MainView.prototype.events = {
        'click button': 'addItem'
      };

      MainView.prototype.initialize = function() {
        console.info('init');
        this.list = new App.Collections.List;
        return this.list.bind('add', this.renderItem);
      };

      MainView.prototype.addItem = function() {
        var item;
        item = new App.Models.Item;
        item.set({
          title: 'jaunais item'
        });
        return this.list.add(item);
      };

      MainView.prototype.renderItem = function(item) {
        var item_view;
        item_view = new App.Views.Item({
          model: item
        });
        return $(this.el).append(item_view.render().el);
      };

      return MainView;

    })(Backbone.View);
    return MainView = new App.Views.MainView();
  });

}).call(this);