<script type="text/undescoretemplate" id="taskForm">
	<form onSubmit="return false;">
		 
		 <legend>Create a Task</legend>
		 <label>Task Name</label>
		 <input type="text" placeholder="Type something..." name="name">
		 
		 <label>Command to execute</label>
		 <input type="text" placeholder="Type something..." name="trigger">
		 <span class="help-block">Must be an absolute path.</span>

		 <label>Description</label>
		 <textarea rows="3" name="description"></textarea>

	</form>
</script>