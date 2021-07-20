import glob
import lxml.etree as et
import os


a = sorted(glob.glob("../mmd-cleaning/**/*.xml",recursive=True))



#lengdeSjekk = sorted(glob.glob("../mmd-cleaning/mmd-clean/**/*.xml",recursive=True))
#print(len(lengdeSjekk))

xslt = et.parse("half_mmd_to_mmd.xsl")
transform = et.XSLT(xslt)
i = 0
for xml_file in a:
    print('\r', 'Konverterer fil {:d} av {:d}\r'.format(i,len(a)),end='',flush=True)
    i +=1
    old = xml_file.split("/")
    if len(old)>4:
        continue
    if len(old)==4:
        if not os.path.exists("../mmd-cleaning/mmd-clean/"+old[-2]):
            os.makedirs("../mmd-cleaning/mmd-clean/"+old[-2])

    dom = et.parse(xml_file)
    newdom = transform(dom)
    (et.tostring(newdom, pretty_print=True))
    file = et.tostring(newdom, pretty_print=True,encoding="unicode")
    if len(old)==4:
    	outfile=open("../mmd-cleaning/mmd-clean/"+old[-2]+"/"+old[-1],"w")
    if len(old)==3:
    	outfile=open("../mmd-cleaning/mmd-clean/"+old[-1],"w")
    outfile.write(file)
    outfile.close()