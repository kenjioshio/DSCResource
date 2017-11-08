# Version="1.0.0.0"
# Product="" 　　　
# Copyright="Kenji Oshio" 
# Company=""

Configuration UAC
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration 
    Import-DscResource -ModuleName xSystemSecurity

    Node localhost
    {
        #該当マシンのUACを変更します。
           xUAC localPCUACConifgration
        {
            #* UAC are enable for following values of Registory key. .The registory key = 1 in these cases.
            #Setting ="AlwaysNotify"
            #Setting ="NotifyChanges"
            #Setting ="NotifyChangesWithoutDimming"
            #Setting ="NeverNotify"

            #* UAC is disable.The registory key = 0 in this case.
            Setting = "NeverNotifyAndDisableAll"
        }
    
    }
}
UAC　-OutputPath .\UAC
Start-DscConfiguration -Wait -Force -Verbose -Path .\UAC -ComputerName Localhost
