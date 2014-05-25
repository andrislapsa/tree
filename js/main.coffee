window.App =
	Models: {}
	Collections: {}
	Views: {}

jQuery ->

	class App.Views.MainView extends Backbone.View

		el: $ '#list'

		activeItem:
			id: null
			view: null

		events:
			'click button.add-new': 'addItem'
			'click button.reset-parent': 'resetParent'

		initialize: ->
			@resetParent()
			@list = new App.Collections.List
			@list.bind 'add', @renderItem
			@list.fetch()

		resetParent: ->
			@activeItem =
				id: null
				view: @el

		addItem: ->
			@list.addNew
				title: 'jaunais item'
				parent_id: @activeItem.id

		addChildItem: ->
			@list.addNew
				title: 'jaunais item'
				parent_id: @activeItem.id

		getObjectParentView: (item) =>
			view = $("#object-#{item.get 'parent_id'}");
			if view.length
				return view
			return $(@el) 

		renderItem: (item) =>
			item_view = new App.Views.Item model: item, parent: @
			@getObjectParentView(item).append item_view.render().el

	MainView = new App.Views.MainView()