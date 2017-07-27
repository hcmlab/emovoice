import urllib.request
import sys

file = sys.argv[1]
url = 'https://github.com/hcmlab/ssi/raw/master/bin/x64/vc140/' + file
src = 'bin\\' + file

print ('download ' + url)
urllib.request.urlretrieve(url, filename=src)

