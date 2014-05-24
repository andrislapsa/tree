window.App =
	Models: {}
	Collections: {}
	Views: {}

jQuery ->

	class App.Views.MainView extends Backbone.View

		el: $ '#list'

		activeObject: null

		mjau: null

		events:
			'click button.add-new' : 'addItem'
			'click button.reset-parent' : 'resetParent'

		initialize: ->
			console.info 'init'

			@resetParent()
			@list = new App.Collections.List
			@list.bind 'add', @renderItem

		resetParent: ->
			@activeObject = @el

		addItem: ->
			item = new App.Models.Item
			item.set title: 'jaunais item'
			item.set position: @list.nextPosition()
			@list.add item

		renderItem: (item) =>
			item_view = new App.Views.Item model: item, parent: @
			$(@activeObject).append item_view.render().el

	MainView = new App.Views.MainView()

	Backbone.sync = (method, model, success, error) ->