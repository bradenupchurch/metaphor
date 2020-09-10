#!/bin/bash
LOGFILE=~/runtime.log
echo "$(date "+%m%d%Y %T") : Starting Metaphor" >> $LOGFILE 2>&1
clear
printf "\\nRequested citation: O. Tange (2011): GNU Parallel - The Command-Line Power Tool\nlogin: The USENIX Magazine, February 2011:42-47."
printf "\n\n\nMetaphor reads a corpus and a search file to perform low level, high-velocity left joins directly in the Bash shell."
printf "\n\nCreated by Braden Feb 2020 v0.1.\n\n\n\n"
#
printf "Results as follows: \n\n\n\n"

#with parallel, decrease block size for high-performance I/O 


#Algorithm:
parallel --pipepart --block 500k -a ./297metaphors.corpus -k --compress grep -iF -f ./input.corpus 
#Normally, without pipepart, max-lines would limit the results.  Python will be used to parse results.
#

if [ "$?" -eq "0" ]
then 
echo "$(date "+%m%d%Y %T") : Ran compare successfully" >> $LOGFILE 2>&1
else
echo "$(date "+%m%d%Y %T") : Ran compare with error $? on exit" >> $LOGFILE 2>&1
fi


#--delimiter ,

printf "\n\n\n\n\n\n"
