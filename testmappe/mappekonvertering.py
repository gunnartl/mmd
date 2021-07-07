import glob
import lxml.etree as et
import os


a = sorted(glob.glob("../mmd-cleaning/**/*.xml",recursive=True))
print(len(a[0].split("/")))
for i in a:
	if len(i.split("/")) > 4:
		print(i)
old = a[0].split("/")
a = sorted(glob.glob("../mmd-cleaning/mdd-clean/**/*.xml",recursive=True))
print(len(a))

#xslt = et.parse("half_mmd_to_mmd.xsl")
#transform = et.XSLT(xslt)
"""
for xml_file in a:
    old = xml_file.split("/")
    if len(old)>4:
        continue
    if len(old)==4:
        if not os.path.exists("../mmd-cleaning/mdd-clean/"+old[-2]):
            os.makedirs("../mmd-cleaning/mdd-clean/"+old[-2])

    dom = et.parse(xml_file)
    newdom = transform(dom)
    (et.tostring(newdom, pretty_print=True))
    file = et.tostring(newdom, pretty_print=True,encoding="unicode")
    if len(old)==4:
    	outfile=open("../mmd-cleaning/mdd-clean/"+old[-2]+"/"+old[-1],"w")
    if len(old)==3:
    	outfile=open("../mmd-cleaning/mdd-clean/"+old[-1],"w")
    outfile.write(file)
    outfile.close()"""