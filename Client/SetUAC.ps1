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
            #[Note]UAC has 5 levels as below(However Windows GUI shows only 4 level. Please keep it in your mind.);
            #Setting ="AlwaysNotify" # Level3: "In Windows GUI, the slider is shown most higest position. "
            #Setting ="NotifyChanges" # Level2: "This is Windwos default vaule. "
            #Setting ="NotifyChangesWithoutDimming" # Level1
            #Setting ="NeverNotify" # Level0: "Once UAC is off, people that log on as administrator will always have the permissions of an administrator." 
                                    #       : "It should be changed to the other more higer level usually."
                                    #       : "The value of 'EnableLUA' is '1' when the UAC setting is equal to or higher than this level."

            Setting = "NeverNotifyAndDisableAll" # Level0'?: "In Windows GUI, the slider is shown most lowest position. The slider position is same as that of 'NeverNotify'. "
                                                 #           "And this configuration is not recommended."The value of 'EnableLUA' is '0'." 
       }
    }
}

UAC　-OutputPath .\UAC
Start-DscConfiguration -Wait -Force -Verbose -Path .\UAC -ComputerName Localhost
