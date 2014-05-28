describe 'Item model', ->
	item = null

	beforeEach ->
		item = new App.Models.Item

	afterEach ->
		item.destroy()
		item = null

	it 'should be valid instance', ->
		expect(item instanceof App.Models.Item).toBeTruthy()