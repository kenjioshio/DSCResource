Configuration SetEnvironmetValue
{
    Node localhost
    {
        Environment EnvironmentValueSettings
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Name = "Path"
            Value = "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\ProgramData\chocolatey\bin;C:\Program Files\TortoiseSVN\bin;C:\Program Files (x86)\NUnit 2.6.4\bin"
        }
    }
}

SetEnvironmetValue -OutputPath EnvironmetValue
Start-DscConfiguration -Wait -Force -Verbose -Path C:\DSCResource\EnvironmetValue -ComputerName Localhost