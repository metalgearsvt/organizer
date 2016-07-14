def jira():
	ticket_num = input("Ticket Key: ")
	desc = input("Description: ")
	time = input("Time worked (in h): ")
	formatted = "\n - " + ticket_num + ": " + desc + "\n\t- Time worked: " + time + "hr\n"
	return formatted

def detail_work():
	mainItem = input("Enter first atomic task: ")
	subItem = []
	userInSub = "@@TEMP@@"
	while userInSub != "":
		userInSub = input("Input sub-item, or enter to skip: ")
		if userInSub != "@@TEMP@@":
			subItem.append(userInSub)
	formatted = "\n - " + mainItem + "\n"
	for si in subItem:
		if si != "":
			formatted = formatted + "\t- " + si + "\n"
	return formatted
	
def msc():
	item = input("Add miscellaneous item: ")
	formatted = "\n - " + item
	return formatted
