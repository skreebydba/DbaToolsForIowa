$instancename = 'localhost';
$fullschedule = 'Ola Weekly Full - Sunday 01:00';
$diffschedule = 'Ola Daily Diff - 01:00 Except Sunday'
$logschedule = 'Ola Daily Log - Every 15 Minutes';
$fulljob = 'DatabaseBackup - USER_DATABASES - FULL'
$diffjob = 'DatabaseBackup - USER_DATABASES - DIFF'
$logjob = 'DatabaseBackup - USER_DATABASES - LOG'
$fullsplat = @{
    SqlInstance = $instancename
    Schedule = $fullschedule
    FrequencyType = 'Weekly'
    FrequencyInterval = 'Sunday'
    StartTime = '010000'
    Job = $fulljob
    #FrequencyRecurrencyFactor = 1
    Force = $true
}
$diffsplat = @{
    SqlInstance = $instancename
    Schedule = $diffschedule
    FrequencyType = 'Weekly'
    StartTime = '010000'
    Job = $diffjob
    Force = $true
}
$logsplat = @{
    SqlInstance = $instancename
    Schedule = $logschedule
    FrequencyType = 'Daily'
    FrequencySubdayType = 'Minutes'
    FrequencySubdayInterval = 15
    Job = $logjob
    Force = $true
}
New-DbaAgentSchedule @fullsplat;
New-DbaAgentSchedule @diffsplat -FrequencyInterval Weekdays, Saturday;
New-DbaAgentSchedule @logsplat;


