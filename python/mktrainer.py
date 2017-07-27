import sys
import xml.dom.minidom as m
import os

srcPath = sys.argv[1]
srcDir = sys.argv[2]
srcFilter = sys.argv[3]
dstPath = sys.argv[4]

# find sample lists

samples = []
for file in os.listdir(srcDir):
    if file.endswith(srcFilter + '.samples'):
        path = os.path.join(srcDir, file)
        print(path)
        samples.append(path)

# insert sample lists in trainer

doc = m.parse(srcPath)
node = doc.getElementsByTagName("samples").item(0)
for sample in samples:
    node.appendChild(doc.createElement('item path=\"' + sample + '\"'))
pretty_xml_as_string = doc.toprettyxml()

# save trainer

file = open(dstPath, 'w')
file.write(doc.toxml())
file.close()

