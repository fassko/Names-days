import urllib
import datetime
import sys

from pyquery import PyQuery as pq

if len(sys.argv) > 1:
	doc = pq(url='http://www.vardadienas.lv/search/' + str(sys.argv[1]))
else:
	doc = pq(url='http://www.vardadienas.lv/search/' + str(datetime.datetime.now().day) + '.' + str(datetime.datetime.now().month))

print doc.find('span[@class="result_name_date"]').text().replace(" ", ", ")