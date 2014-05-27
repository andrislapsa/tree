class App.Collections.List extends Backbone.Collection

	model: App.Models.Item

	localStorage: new Store('tree_objects')

	getNewId: ->
		return 1 if !@length
		@last().get('id') + 1

	addNew: (data) ->
		item = new App.Models.Item
		item.set _.extend
			id: @getNewId()
			data
		@add item
		item.save()

	comparator: (item) ->
		item.get 'id'