var Task = Backbone.Model.extend({
	initialize: function(){},
	url:'/API/task',
	log: function(){
		$('#'+taskid+'-logger-container').show();
		global_timers.push({'function':current_task.refreshlog,'parameters':this.id});
	},
	refreshlog: function(taskid){
		console.info('refreshing log',taskid)
		
		$.ajax({
			url: "/API/task/log/"+taskid,
			success: function(data){
				$('#'+taskid+'-logger').html(data);

				$('#'+taskid+'-logger').scrollTop = $('#'+taskid+'-logger').scrollHeight;
			}
		});
		
	},
	start: function(){
		current_task = this;
		$.ajax({
			url: "/API/task/run/"+this.id,
			success: function(data){
				current_task.log()
			  	
			}
		});
	},
	stop: function(){
		$.ajax({
			  url: "/API/task/stop/"+this.id,
			  success: function(data){
			  	$('#'+taskid+'-logger-container').show();
				global_timers.push({'function':current_task.refreshlog,'parameters':this.id});
			  	$('#'+taskid+'-logger-container').hide();
			  }
			});
	},
	restart: function(){
		$.ajax({
			  url: "/API/task/restart/"+this.id,
			  success: function(data){
			  }
			});
	},
});