describe 'List collection', ->
	list = null

	beforeEach ->
		mock_data = [
			{ id: 1, title: 'Parent 1' }
			{ id: 2, parent_id: 1, title: 'Child 1' }
			{ id: 3, title: 'Parent 2' }
			{ id: 4, title: 'Parent 3' }
		]

		list = new App.Collections.List mock_data

	afterEach ->
		list.each (item) -> item.destroy()
		list.reset()
		list = null

	it 'should create correct id when empty', ->
		list.reset()
		expect(list.getNewId()).toEqual 1
		
	it 'should create correct id when not empty', ->
		expect(list.getNewId()).toEqual 5

	it 'should insert new parent item', ->
		list.addNew
			title: 'Title'

		expect(list.length).toEqual 5
		expect(list.last().toJSON()).toEqual
			id: 5
			parent_id: null
			title: 'Title'

	it 'should insert new child item', ->
		list.addNew
			title: 'Title'
			parent_id: 3
		expect(list.last().toJSON()).toEqual
			id: 5
			parent_id: 3
			title: 'Title'

	it 'should remove item without children', ->
		list.at(2).removeItem()
		expect(list.length).toEqual 3

	it 'should remove item with children', ->
		list.first().removeItem()
		expect(list.length).toEqual 2

	it 'should have compatator by id', ->
		expect(list.comparator list.at(0)).toEqual 1
		expect(list.comparator list.at(3)).toEqual 4