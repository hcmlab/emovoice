import os
import sys
import ntpath

rootdir = sys.argv[1]

fp = open(rootdir + 'list.txt', 'w')

for root, subdirs, files in os.walk(rootdir):
    for file in files:      
        name, ext = os.path.splitext(file)
        if ext.lower() == '.wav':
            print(root + '\\' + file)        
            path = root + '\\' + file
            label = ntpath.basename(root)
            fp.write(path + ';' + label + '\n')

fp.close()
        