# Version="1.0.0.0"
# Product="" 　　　
# Copyright="Kenji Oshio" 
# Company=""
# DSC configuration for Firewall 
#  

# 本Configurationは64bitのResourceを使用するので、Program Files(x86)配下のPowershellから実行する際には注意すること。
# xNetworkingが内部で読んでいるMSFT_xXXXXは64bitで実行されるのでProgram Files配下のPowershellのExecution PolicyがRemote Signed以上にセットしないと動かないでーす。
# (Start-DscConfiguration実行時にこけます。)

configuration Add_FirewallRuleToExistingGroup 
{ 
    Import-DscResource -ModuleName PSDesiredStateConfiguration 
    Import-DscResource -ModuleName xNetworking

    Node localhost
    { 
        xFirewall Firewall_UDP 
        { 
            Name                  = 'UDP 123' 
            DisplayName           = 'UDP 123' 
            Enabled               = 'True' 
            Ensure                = 'Present' 
            Direction             = 'Inbound'
            Action                ='Allow'
            Protocol              = 'UDP'
            LocalPort             = ('123')
            Profile               = ('Domain', 'Private','Public')
            Description           = 'This is a test configuration'
#            Program               = 'c:\windows\system32\notepad.exe'
#            Service               = 'WinRM'

        } 
    } 
 }

Add_FirewallRuleToExistingGroup -OutputPath .\Add_FirewallRuleToExistingGroup 
Start-DscConfiguration -Wait -Force -Verbose -Path .\Add_FirewallRuleToExistingGroup  -ComputerName Localhost
