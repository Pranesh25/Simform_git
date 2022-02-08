#! /bin/bash

date

date +%m 
#specifies the month

date +%h
#specifies the abbreviated month

date +%B 
#specifies the full month name

date +%d
#specifies the day of the month

date +%y
#specifies the year

date +%H,+%M,+%S
#specifies the hour , minute , seconds

date +%D
#specifies the date as mm/dd/yy

date +%T
#specifies the time as hh:mm:ss


date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"