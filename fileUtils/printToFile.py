import datetime, os, sys
import constants.constants as C

class ptf:
	def __init__(self):
		self.fileName = ""
		self.root_dir = os.path.dirname(os.path.realpath(sys.argv[0]))
		self.dateFile()

	def dateFile(self):
		self.fileName = str(datetime.date.today())
		self.jira = self.root_dir + "/" +  C.jira_op + "/" + self.fileName
		self.msc = self.root_dir + "/" + C.msc_op + "/" + self.fileName
		self.noTicket = self.root_dir + "/" + C.no_ticket_op + "/" + self.fileName
		with open(self.jira, "a+") as fo:
			fo.write("")
		with open(self.msc, "a+") as fo:
			fo.write("")
		with open(self.noTicket, "a+") as fo:
			fo.write("")

	def writeOut(self, content, type):
		if type == C.JIRA:
			floc = self.jira
		elif type == C.MSC:
			floc = self.msc
		elif type == C.NOTI:
			floc = self.noTicket
		else:
			return
		with open(floc, "a+") as fo:
			fo.write(content)
			fo.write(" ")
		return
