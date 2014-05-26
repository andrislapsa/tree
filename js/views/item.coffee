class App.Views.Item extends Backbone.View
	
	tagName: 'div'

	events:
		'click > .add-child': 'addChild'
		'click > .remove-item': 'removeItem'
		'keyup input': 'update'

	initialize: (options) ->
		@parent = options.parent
		@list = options.list
		@template = _.template($('#item-template').html())

	render: =>
		@setElement this.template @model.toJSON()
		@input = $(@el).find('input');
		@

	update: ->
		@model.save({ title: @input.val() })

	addChild: ->
		@list.addNew
			title: 'jaunais item'
			parent_id: @model.get 'id'

	removeItem: ->
		@model.removeItem()
		@remove()