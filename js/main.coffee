requirejs.config
	baseUrl: 'js/libs'
	paths:
		app: '..'
		views: '../views'
		models: '../models'
		collections: '../collections'

	shim:
		'backbone-localstorage':
			deps: ['backbone']
			exports: 'Backbone'

window.dom_loaded = false

require [
	'underscore',
	'jquery',
	'backbone',
	'views/list'
], (_, $, Backbone, ListView) ->
	ListView = new ListView el: $ '#list'
	dom_loaded = true