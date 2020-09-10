#!/bin/bash
set +e
#We are here to support you
#file URL if fail and refactoring:  https://build.opensuse.org/package/show/home:tange/parallel

LOGFILE=~/installer.log
echo "$(date "+%m%d%Y %T") : Starting install" >> $LOGFILE 2>&1


chmod 755 install.sh installer.log metaphor.sh runtime.log logging.py


#Rollout a welcome mat
clear
# cat art.ascii
sleep .4
printf "\n\nDependencies installation for metaphor bash tool.\n"
sleep .3 
printf "Created by Braden Feb 2020, v0.1.\n\n\n\n"
sleep 1


#These are WIP test cases for checking for the existence of parallel on the system.  
#
#hash parallel 2>/dev/null || { echo >&2 "I require parallel but it's not installed.  Aborting."; exit 10; }
#parallel --minversion 20200122 >> $LOGFILE
#echo "$(date "+%m%d%Y %T") : $? exit with testing for parallel version" >> $LOGFILE 2>&1
# if fail will exit with 255, else its a 0
#echo "$(date "+%m%d%Y %T") : Failed parallel version check with $?" >> $LOGFILE 2>&1
#exec 3>&1 1>>${LOGFILE} 2>&1
#if [ "$?" -eq "0" ]
#    then
#        printf "Your system is compliant with dependencies."
#exit    
#if [ "$?" -eq "127" ]


wget ftp://ftp.gnu.org/gnu/parallel/parallel-20200122.tar.bz2
tar xjf parallel-20200122.tar.bz2
cd parallel-20200122
./configure && make
if [ "$?" -eq "0" ]
then 
    printf "Parallel version 20200122 install has started."
    echo "$(date "+%m%d%Y %T") : finished make stage" >> $LOGFILE 2>&1
#    sleep 1
else
    printf "parallel exited with fatal error condition: $?"
    echo "$(date "+%m%d%Y %T") : exited with fatal error condition: $?" >> $LOGFILE 2>&1
    printf "For support, contact devopsinstallteam@*.com"
    sleep 5  
fi      
#exitnstalled
sudo make install
if [ "$?" -eq "0" ]
then 
    printf "\n\n\n\n\nParallel version 20200122 has installed successfully.\n\n\n\n"
    parallel --version --citation

#    sleep 1
else
     printf "parallel exited install phase with fatal error condition: $?"
    echo "$(date "+%m%d%Y %T") : install exited with fatal error condition: $?" >> $LOGFILE 2>&1
    printf "For support, contact devopsinstallteam@*.com"
    sleep 5  
fi      
