<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<!-- Set the viewport width to device width for mobile -->
		<meta name="viewport" content="width=device-width" />
		<title>Pipeman Control Deck</title>
		
		<!-- CSS Files -->
		%include partials/css_partial get_url=get_url
		
		<!-- JS Files -->
		%include partials/js_partial get_url=get_url
		
	</head>

	<body>
		
		<div class="container">

			<div class="span9"><h1>Pipeman Control deck</h1></div>

			<div class="span10">
				<form action="/task" method="POST">
					 % if task is None:
					 <legend>Create a Task</legend>
					 
					 <label>Task Name</label>
					 <input type="text" placeholder="Type something..." name="name">
					 
					 <label>Command to execute</label>
					 
					 <input type="text" placeholder="Type something..." name="trigger">
					 <span class="help-block">Must be an absolute path.</span>

					 <label>Description</label>
					 <textarea rows="3" name="description"></textarea>
					 % else:
					<legend>Edit Task</legend>
					 
					 <label>Task Name</label>
					 <input type="text" placeholder="" name="name" value="{{task.name}}">
					 
					 <label>Command to execute</label>
					 
					 <input type="text" placeholder="" name="trigger" value="{{task.trigger}}">
					 <span class="help-block">Must be an absolute path.</span>

					 <label>Description</label>
					 <textarea rows="3" name="description">{{task.description}}</textarea>

					 <input type="hidden" placeholder="" name="id" value="{{task.id}}">
					 % end

					<div class="row">
					 	<input type="submit" class="btn btn-success" value="Save">
					 	<a class="btn" href="/">Cancel</a>
					</div>

				</form>
			</div>
		</div>
	
	</body>
</html>