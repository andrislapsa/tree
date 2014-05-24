class App.Views.Item extends Backbone.View
	
	tagName: 'div'

	events:
		'click > input': 'doStuff',
		'blur input': 'update'

	initialize: (options) ->
		@parent = options.parent
		@model.bind 'change', @render

	render: =>
		@input = $('<input/>').val(@model.get 'title')
		$(@el).html(@input)
		@

	update: ->
		@model.save({ title: @input.val() })

	doStuff: ->
		@parent.activeObject = @el
		console.info '---'
		console.info "#{@model.get 'position'}: #{@model.get 'title'}"