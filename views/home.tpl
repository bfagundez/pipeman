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

			<div class="span9 centered"><h1>Pipeman Control deck</h1></div>

			<div class="span12 centered">
				<h2>Task List</h2>
				<table class="table table-bordered table-stripped">
					<thead>
						<tr>
							<th>Name</th>
							<th>Control</th>
							<th>Status</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						% for t in tasks:
							<tr>
								<td>{{t.name}}</td>
								<td>
									<div class="btn-group">
									  <button class="btn btn-small start-task" data-taskid="{{t.id}}">Start</button>
									  <button class="btn btn-small stop-task" data-taskid="{{t.id}}">Stop</button>
									  <button class="btn btn-small restart-task" data-taskid="{{t.id}}">Restart</button>
									</div>
								</td>
								<td>{{t.status}}</td>
								<td>
									<div class="btn-group">
										<a class="btn btn-small" href="/task/{{t.id}}">Edit</a>
										<a class="btn btn-small btn-danger" href="/delete_task/{{t.id}}">Delete</a>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="display:none;" id="{{t.id}}-logger-container">
									Output:
									<form >
										<textarea id="{{t.id}}-logger" class="span8" rows="4"></textarea>
									</form>
								</td>
							</tr>
						% end
					</tbody>
				</table>
			</div>
			<div class="span9">
				<a href="/task" class="btn btn-success btn-large">Add a new task</a>
			</div>


		</div>

	</body>
</html>