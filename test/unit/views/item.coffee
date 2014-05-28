jasmine.getFixtures().fixturesPath = '/base/test/fixtures/'

class TestItem extends App.Models.Item
	url: '#'

	removeItem: ->
		@destroy()

describe 'Item view', ->
	item =
	view = null

	beforeEach ->
		item = new TestItem

		loadFixtures 'index.html'
		view = new App.Views.Item
			template: $('#jasmine-fixtures #item-template').html()
			model: item

	afterEach ->
		item.destroy()
		item = null
		view.remove()
		view = null

	it 'shoud render parent item', ->
		item.set { id: 1, title: 'Parent 1' }
		view.render()

		expect(view.input.val()).toEqual 'Parent 1'

	it 'should update model', ->
		item.set { id: 1, title: 'Parent 1' }
		view.render()

		view.input.val('Parent title changed').keyup()

		expect(item.get 'title').toEqual 'Parent title changed'

	it 'should remove when remove button clicked', ->
		item.set { id: 1, title: 'Parent 1' }
		view.render()

		$(view.el).find('.remove-item').click()

		expect(view.el).toEqual null