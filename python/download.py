import urllib.request
import sys

src = sys.argv[1]
dst = sys.argv[2]

print ('downloading ' + src + '...')
urllib.request.urlretrieve(src, filename=dst)
print ('done')

