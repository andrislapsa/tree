define ['models/item', 'backbone', 'backbone-localstorage'], (ItemModel, Backbone) ->
	class ListCollection extends Backbone.Collection

		model: ItemModel

		localStorage: new Store('tree_objects')

		getNewId: ->
			return 1 if !@length
			@last().get('id') + 1

		addNew: (data) ->
			item = new ItemModel
			item.set _.extend
				id: @getNewId()
				data
			@add item
			item.save()

		comparator: (item) ->
			item.get 'id'

	return ListCollection