# Version="1.0.0.0"
# Product="" 　　　
# Copyright="Kenji Oshio" 
# Company=""

Configuration SetEnvironmentVariable
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration    
    Node localhost
    {
        Environment EnvironmentVariable_Path
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Name = "Path"
            Value = "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\ProgramData\chocolatey\bin;C:\Program Files\TortoiseSVN\bin;C:\Program Files (x86)\NUnit 2.6.4\bin;C:\Program Files\Git\cmd"
        }

        Environment EnvironmentVariable_VS120COMNTOOLS
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Name = "VS120COMNTOOLS"          
            Value = "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\"
        }

    }
}

SetEnvironmentVariable -OutputPath .\EnvironmentVariable
Start-DscConfiguration -Wait -Force -Verbose -Path .\EnvironmentVariable -ComputerName Localhost