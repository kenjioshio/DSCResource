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
            #* UAC has 4 levels as below;
            #Setting ="AlwaysNotify" #Level3: "In Windows GUI, the slider is shown most higest position. "
            #Setting ="NotifyChanges" #Level2: "This is Windwos default vaule. "
            #Setting ="NotifyChangesWithoutDimming" #Level1
            #Setting ="NeverNotify" #Level0: "In Windows GUI, the slider is shown most lowest position. And this configuration is not recommended." 
            #                              : "It should be changed to the other more higer level usually."

            Setting = "NeverNotifyAndDisableAll"
       }
    }
}

UAC　-OutputPath .\UAC
Start-DscConfiguration -Wait -Force -Verbose -Path .\UAC -ComputerName Localhost
