class App.Collections.List extends Backbone.Collection

	model: App.Models.Item

	nextPosition: ->
		return 1 if !@length
		@last().get('position') + 1