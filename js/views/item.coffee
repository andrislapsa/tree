class App.Views.Item extends Backbone.View
	
	tagName: 'div'

	events:
		'click > .input-group .add-child': 'addChild'
		'click > .input-group .remove-item': 'removeItem'
		'keyup > .input-group input': 'update'

	initialize: (options) ->
		@template = _.template $('#item-template').html()

	render: =>
		@setElement this.template @model.toJSON()
		@input = $(@el).find 'input'
		@

	update: ->
		@model.save
			title: @input.val()

	addChild: ->
		@model.collection.addNew
			parent_id: @model.get 'id'

	removeItem: ->
		@model.removeItem()
		@remove()