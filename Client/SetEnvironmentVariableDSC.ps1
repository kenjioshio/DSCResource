Configuration SetEnvironmentVariable
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node localhost
    {
        Environment EnvironmentVariableSettings
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Name = "Path"
            Value = "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\ProgramData\chocolatey\bin;C:\Program Files\TortoiseSVN\bin;C:\Program Files (x86)\NUnit 2.6.4\bin;C:\Program Files\Git\cmd"
        }
    }
}

SetEnvironmentVariable -OutputPath .\EnvironmentVariable
Start-DscConfiguration -Wait -Force -Verbose -Path .\EnvironmentVariable -ComputerName Localhost