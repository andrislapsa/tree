jasmine.getFixtures().fixturesPath = '/base/test/fixtures/'

describe 'List view', ->
	view = null

	beforeEach ->
		loadFixtures 'index.html'
		elem = $('#jasmine-fixtures #list').clone()
		view = new App.Views.List el: elem

	afterEach ->
		view.list.each (item) -> item.removeItem()
		view.remove()
		view = null

	it 'should add & render item', ->
		$(view.el).find('.add-new').click()
		expect($(view.el).find('#object-1').length).toEqual 1

	it 'should find parent view', ->
		expect(
			$(view.getObjectParentView new App.Models.Item).is('#list')
		).toEqual true

	it 'should find view for item', ->
		view.addItem()
		parent = view.list.last()
		expect(
			$(view.getObjectParentView parent).find('#object-1').length
		).toEqual 1