from pyquery import PyQuery as pq
import urllib
import datetime

print pq(url='http://www.vardadienas.lv/search/' + str(datetime.datetime.now().day) + '.' + str(datetime.datetime.now().month)).find('span[@class="result_name_date"]').text().replace(" ", ", ")