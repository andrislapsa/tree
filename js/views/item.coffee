define [], () ->
	class ItemView extends Backbone.View
		
		tagName: 'div'

		events:
			'click > .input-group .add-child': 'addChild'
			'click > .input-group .remove-item': 'removeItem'
			'keyup > .input-group input': 'onChange'

		initialize: (options) ->
			@template = _.template options.template

		render: =>
			@setElement this.template @model.toJSON()
			@input = $(@el).find 'input'
			@

		onChange: (e) ->
			@update()
			@addChild() if e.keyCode == 13 

		update: ->
			@model.save
				title: @input.val()

		addChild: ->
			@model.collection.addNew
				parent_id: @model.get 'id'

		removeItem: ->
			@model.removeItem()
			@remove()
			@el = null

	return ItemView