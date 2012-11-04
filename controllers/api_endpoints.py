from bottle import *
from server import *
import model
import pipeman

taskHub = {}

@webApp.get('/API/task/')
@webApp.get('/API/task')
def get_tasks():
	db = model.Session()
	tasks = db.query(model.Task).all()
	tasklist = []
	for t in tasks:
		tasklist.append({'id':t.id,'name':t.name,'description':t.description,'status':t.status})

	return { 'records':tasklist }

@webApp.get('/API/task/run/<taskid>')
@webApp.get('/API/task/run/<taskid>/')
def run_task(taskid):
	payload = {}
	db = model.Session()
	task = db.query(model.Task).get(taskid)

	task_proc = pipeman.Process(task.trigger)
	print 'starting this task : '+str(task)
	print 'starting this task : '+str(task.trigger)
	task_proc.start()

	taskHub[str(task.id)] = task_proc
	# true by default here, add some error control
	payload['success'] = True
	return payload

@webApp.get('/API/task/stop/<taskid>')
@webApp.get('/API/task/stop/<taskid>/')
def run_task(taskid):
	payload = {}

	task_proc = taskHub[str(taskid)]
	try:
		task_proc.stop()
	except Exception, e:
		pass
	
	# true by default here, add some error control
	payload['success'] = True
	return payload

@webApp.get('/API/task/restart/<taskid>')
@webApp.get('/API/task/restart/<taskid>/')
def run_task(taskid):
	payload = {}
	task_proc = taskHub[str(taskid)]
	task_proc.restart()
	# true by default here, add some error control
	payload['success'] = True
	return payload

@webApp.get('/API/task/log/<taskid>')
@webApp.get('/API/task/log/<taskid>/')
def log_task(taskid):
	payload = {}
	task_proc = taskHub[taskid]
	return task_proc.log

@webApp.post('/API/task')
@webApp.post('/API/task/')
def create_task(id):
	db = model.Session()
	task = model.Task()
	# load request.parameters
	return task

@webApp.put('/API/task/<id>')
def update_resource(id):
	return None

@webApp.delete('/resource/<id>')
def delete_resource(id):
	return None