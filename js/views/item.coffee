class App.Views.Item extends Backbone.View
	
	tagName: 'li'

	initialize: ->
		@model.bind 'change', @render

	render: =>
		$(@el).html "heisā #{@model.get 'title'} hopsā"
		@