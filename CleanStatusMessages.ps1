
#LET OP DE TRIGGERSCHEDULE HOEVEELHEID nullen goed tellen
# DOC : https://docs.microsoft.com/en-us/mem/configmgr/develop/reference/core/clients/client-classes/triggerschedule-method-in-class-sms_client

Stop-Service -Name CcmExec
 (Get-Service 'CcmExec').Status 
 (Get-WmiObject Win32_Processor | where {$_.DeviceID -eq 'CPU0'}).AddressWidth
  ([wmi]"ROOT\ccm:SMS_Client=@").ClientVersion
   (Get-ItemProperty("HKLM:\SOFTWARE\Microsoft\SMS\Client\Configuration\Client Properties")).$("Local SMS Path")
    get-childitem 'C:\Windows\CCM\ServiceData\Messaging\EndpointQueues' -include *.msg,*.que -recurse | foreach ($_) {remove-item $_.fullname -force}
     get-wmiobject -query "SELECT * FROM Win32_Service WHERE Name ='CcmExec'" -namespace "ROOT\cimv2"
    
       (Get-Service 'CcmExec').Status 
       
       Start-Service -Name CcmExec

       sleep 1

      #Invoke-WmiMethod -Namespace root\ccm -Class sms_client -Name TriggerSchedule "00000000-0000-0000-0000-0000000000112"

      # ([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('00000000-0000-0000-0000-000000000112')

      #([wmiclass]"root\ccm:SMS_Client").TriggerSchedule("{00000000-0000-0000-0000-00000000000112}")

      Invoke-CimMethod -Namespace 'root\CCM' -ClassName SMS_Client -MethodName TriggerSchedule -Arguments @{sScheduleID='{00000000-0000-0000-0000-000000000112}'}

      Invoke-CimMethod -Namespace 'root\CCM' -ClassName SMS_Client -MethodName TriggerSchedule -Arguments @{sScheduleID='{00000000-0000-0000-0000-000000000003}'}





      
        #([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('{00000000-0000-0000-0000-000000000112}')
         #[wmi]"ROOT\ccm\invagt:InventoryActionStatus.InventoryActionID='{00000000-0000-0000-0000-000000000003}'" | remove-wmiobject
      #    ([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('{00000000-0000-0000-0000-000000000003}')
