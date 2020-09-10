import pandas as pd 
from datetime import time # this is only here for logging
from datetime import datetime # this is only here for logging
import re

headers         = ['query', 'prefix', 'max_count','xyz'] 
iQueryFile      = pd.read_csv('/SLinput.csv', names=headers)
inputFormat     = open('/input.corpus')
logFile         = open('/python.log', mode='a')
finishedFile    = open('/stdOut.finished', mode='w')

today = datetime.now()
logFile.write("Started Python metaphor script: %s, " % today)

print(iQueryFile)
sorted = (iQueryFile.prefix.value_counts())

print(sorted)


#don't send sorted to this.  send output from compare.
sorted.to_csv(finishedFile, sep=',')

inputFormat.close()
logFile.write("engine completed.")
logFile.close()
finishedFile.close()
