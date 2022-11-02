### This script is nothing more but a 
### proof of concept.
### WE DO NOT ENCOURAGE PROCRASTINATION!
### GET THE JOB DONE!
import time

semester_months = 5

class Unprocrastinator:
    def __init__(self):
        self.tasks = []
    def procrastinate(self, task):
        self.tasks.append(task)
    def unprocrastinate(self):
        return self.tasks.pop(0)
    def is_job_done(self):
        return len(self.tasks) == 0

p = Unprocrastinator()

print("Receiving tasks...")
p.procrastinate("ACSO")
p.procrastinate("OOP homework")
p.procrastinate("Bachelor's project")
print("Sleeping...")
time.sleep((semester_months - 1) * 30 * 24 * 60 * 60) # in seconds

while not p.is_job_done():
    print("Working on", p.unprocrastinate())

print("Finally, job done!!!")