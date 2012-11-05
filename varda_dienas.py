import datetime
import sys
import json

try:
	f = open('json.txt', 'r').read()
	v = json.loads(f)

	if len(sys.argv) > 1:
		print ", ".join(v[str(sys.argv[1]).split(".")[1]][str(sys.argv[1]).split(".")[0]])
	else:
		print ", ".join(v[str(datetime.datetime.now().month)][str(datetime.datetime.now().day)])
except:
	"Can't find a names"