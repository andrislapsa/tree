window.App =
	Models: {}
	Collections: {}
	Views: {}

jQuery ->

	class App.Views.MainView extends Backbone.View

		el: $ 'body'

		events:
			'click button' : 'addItem'

		initialize: ->
			console.info 'init'

			@list = new App.Collections.List
			@list.bind 'add', @renderItem

		addItem: ->
			item = new App.Models.Item
			item.set title: 'jaunais item'
			@list.add item

		renderItem: (item) =>
			item_view = new App.Views.Item model: item
			$(@el).append item_view.render().el

	MainView = new App.Views.MainView()