from checkMMD import CheckMMD
from createMETUUID import create_MET_uuid
import glob

checkFiles = sorted(glob.glob("../mmd-cleaning/mmd-clean/*/*.xml",recursive=True))

checkFiles = sorted(glob.glob("../mmd-cleaning/mmd-clean/UGOT-data/*.xml",recursive=True))
print(len(checkFiles))
xsdFile = "../xsd/mmd.xsd"

#checkFiles = sorted(glob.glob("../manuellRens/*/*.xml",recursive=True)) 


dummeFiler=[]


xsltSort = "../xslt/sort_mmd_according_to_xsd.xsl"
nr = 0
for i in checkFiles:
	print("Fil nr: ",nr)
	a = CheckMMD(i,xsdFile,xsltSort,nr)
	if not a.check_mmd():
		dummeFiler.append(i)
		print(dummeFiler)
	del(a)
	nr+=1
print("må sjekkes:")
print(dummeFiler)