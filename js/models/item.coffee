class App.Models.Item extends Backbone.Model

	defaults:
		id: null,
		parent_id: null
		title: ''

	getChildren: (id) ->
		result = @collection.where({ parent_id: id })

		for item in result
			children = @getChildren item.id
			continue if !children.length
			_.each children, (item) -> result.push item

		result

	removeItem: ->
		_.each @getChildren(@id), (item) -> item.destroy()
		@destroy()