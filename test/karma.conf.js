// karma.conf.js
module.exports = function(config) {
	config.set({
		basePath: '../',

		files: [
			'js/libs/underscore.js',
			'js/libs/jquery.js',
			'js/libs/backbone.js',
			'js/libs/*.js',
			'test/libs/*.js',
			
			'test/main.js',
			'js/models/*.js',
			'js/collections/*.js',
			'js/views/*.js',
			
			'test/fixtures/*.html',
			'test/unit/**/*.js',
			'test/libs/jasmine-jquery.js',
		],

		frameworks: ['jasmine']
	});
};