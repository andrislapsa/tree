window.App =
	Models: {}
	Collections: {}
	Views: {}
	loaded: false

$ ->
	ListView = new App.Views.List el: $ '#list'
	App.loaded = true