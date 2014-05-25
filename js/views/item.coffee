class App.Views.Item extends Backbone.View
	
	tagName: 'div'

	events:
		'click > input': 'doStuff'
		'click > button': 'test'
		'blur input': 'update'

	initialize: (options) ->
		@parent = options.parent
		# @model.bind 'change', @render
		@template = _.template($('#item-template').html())

	render: =>
		console.info @model.toJSON()
		@setElement this.template @model.toJSON()
		@input = $(@el).find('input');
		@

	update: ->
		@model.save({ title: @input.val() })

	doStuff: =>
		@parent.activeItem =
			id: @model.get 'id'
			view: @el

	test: ->
		alert 'test'