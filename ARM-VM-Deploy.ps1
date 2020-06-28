
#Login to Azure Service principal
$clientID = "5e5a4c2b-698d-41ff-ab90-9cb5c5ad241e"
$key = "G7MBTZ~hx24Mw1-rwW_qjTiS1Vj469fUdM"
$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force 
$resourceGroupName = "ARMDeployment"
$dnsLabelPrefix = "MyARMDns"
$location="centralus"
$adminUsername = "ARMVM"
$pass="password1"
$adminPassword = $pass | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential `
     -argumentlist $clientID, $SecurePassword
$tenantID = "754ea086-8884-4f3d-a4f8-c32a2fda3a7b"

Add-AzureRmAccount -Credential $cred -TenantId $tenantID -ServicePrincipal



New-AzureRmResourceGroup -Name $resourceGroupName -Location "$location"
New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri "https://raw.githubusercontent.com/govindvtra/ARM_Template/master/VM-Resource.json"

 (Get-AzureRmVm -ResourceGroupName $resourceGroupName).name
