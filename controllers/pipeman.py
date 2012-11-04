import subprocess
from threading import Thread

class Process:
	
	log = []
	
	def __init__(self, trigger):
		self.trigger = trigger
		self.log = []
	
	def stop(self):
		self.p.kill()
		pass

	def restart(self):
		self.stop()
		self.start()
		pass

	def start(self):    
		
		self.p = subprocess.Popen(self.trigger, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
		
		t = Thread(target=self.populate_output)
		t.daemon = True
		t.start()

		pass

	def populate_output(self):
		p = self.p

		while(True):
			retcode = p.poll() #returns None while subprocess is running
			stdoutline = p.stdout.readline()
			self.log.append(stdoutline)
			
			if(retcode is not None):
				break

    
