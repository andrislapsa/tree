define [], () ->
	class ItemModel extends Backbone.Model

		defaults:
			id: null,
			parent_id: null
			title: ''

		removeItem: ->
			for item in @collection.where { parent_id: @id }
				@removeItem.apply item
			@destroy()

	return ItemModel