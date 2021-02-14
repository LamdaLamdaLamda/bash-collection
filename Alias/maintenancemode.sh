#!/bin/bash
###################################################################
#Script Name  : maintenancemode.sh
#Description  : Deactivates any networking service/connection for 
#             : maintenance reasons, by switching the runlevel
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias maintenancemode='systemctl isolate rescue.target'