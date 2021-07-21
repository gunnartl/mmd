from createMETUUID import create_MET_uuid
import glob

files = sorted(glob.glob("../mmd-cleaning/mmd-clean/**.xml",recursive=True))

for i in files:
	create_MET_uuid(i,True)