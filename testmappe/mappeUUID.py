from createMETUUID import create_MET_uuid
import glob

#checkFiles = sorted(glob.glob("../mmd-cleaning/mmd-clean/*/*.xml",recursive=True))
#print(len(checkFiles))
#checkFiles = sorted(glob.glob("../mmd-cleaning/mmd-clean/vagabond/*.xml",recursive=True))
xsdFile = "../xsd/mmd.xsd"

checkFiles = sorted(glob.glob("../manuellRens/*/*.xml",recursive=True))

for i in checkFiles:
	create_MET_uuid(i,True)