var Tasks = Backbone.Collection.extend({
	initialize: function(){},
	model: Task,
	url:'/API/task',
	parse: function(response) {
		return response.records;
	}
});