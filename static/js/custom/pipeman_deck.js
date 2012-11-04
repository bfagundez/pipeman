
function reloadLog(){
	var pid = $('#project_output').data('pid');
	
}

// add a backbone collection 
global_timers = []

/*
var TimeManager = {
	addTimer: function(timerobj){
		global_timers.push(timerobj)
	},
	runTimers: function(){
		for(timer in global_timers){
			slot = global_timers[timer]
			slot['function'](slot['parameters']);
		}
	}
}
*/

global_timers.push()

function runTimers(){
	for(timer in global_timers){
			slot = global_timers[timer]
			slot['function'](slot['parameters']);
		}
}


$(function(){
	
	setInterval("runTimers()",2000);

	// initialize tasklist
	tasks = new Tasks()
	tasks.fetch()

	$('.start-task').click(function(){
		taskid = $(this).data('taskid')
		task = tasks.where({ 'id': taskid})[0]
		task.start()
	})
	$('.stop-task').click(function(){
		taskid = $(this).data('taskid')
		task = tasks.where({ 'id': taskid})[0]
		task.stop()
	})
	$('.restart-task').click(function(){
		taskid = $(this).data('taskid')
		task = tasks.where({ 'id': taskid})[0]
		task.restart()
	})

		
})



// function reloadLog(){
// 			var pid = $('#project_output').data('pid');
// 			$.ajax({
// 			  url: "/API/getstdout/"+pid,
// 			  success: function(data){
// 			  	$('#project_output').html(data);
// 			  }
// 			});

// 		}

// 		$(function(){

			

// 			$('#start').click(function(){
// 				$.ajax({
// 				  url: "/API/start",
// 				  success: function(data){
// 				  	$('#project_output').data('pid',data.pid);
// 				  	$(document).everyTime(1000, function(i) {
// 					  reloadLog();
// 					})
// 				  }
// 				});
// 			})

// 			$('#stop').click(function(){
// 				var pid = $('#project_output').data('pid');
// 				$.ajax({
// 				  url: "/API/stop/"+pid,
// 				  success: function(data){
// 				  	$(document).stopTime()
// 				  }
// 				});	
// 			})

// 			$('#restart').click(function(){
// 				var pid = $('#project_output').data('pid');
// 				$.ajax({
// 				  url: "/API/restart/"+pid,
// 				  success: function(data){
// 				  	$('#project_output').data('pid',data.pid);
// 				  	$(document).everyTime(1000, function(i) {
// 					  reloadLog();
// 					})
// 				  }
// 				});	
// 			})
// 		})