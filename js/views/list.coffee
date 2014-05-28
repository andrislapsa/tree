class App.Views.List extends Backbone.View

	events:
		'click button.add-new': 'addItem'

	initialize: ->
		@list = new App.Collections.List
		@list.bind 'add', @renderItem
		@list.fetch()

	addItem: ->
		@list.addNew {}

	getObjectParentView: (item) =>
		view = $(@el).find "#object-#{item.get 'parent_id'}"
		return view if view.length
		$(@el)

	renderItem: (item) =>
		item_view = new App.Views.Item
			model: item
			template: $('#item-template').html()
		@getObjectParentView(item).append item_view.render().el
		item_view.input.focus() if App.loaded