Param(
    [Parameter(mandatory = $true)]
    [ValidateSet("start", "stop", "F2", "F4", "F8", "F16", "F32", "F64", "F128", "F256", "F512", "F1024", "F2048")]
    [string]$capacityMode,
    [Parameter(mandatory = $true)]
    [string]$resourceGroupName,
    [Parameter(mandatory = $true)]
    [string]$capacityName

)

Connect-AzAccount -Identity

if($capacityMode -eq "start"){
    Resume-AzFabricCapacity -ResourceGroupName $resourceGroupName -CapacityName $capacityName
}elseif ($capacityMode -eq "stop") {
    Suspend-AzFabricCapacity -ResourceGroupName $resourceGroupName -CapacityName $capacityName
}else {
    Update-AzFabricCapacity -ResourceGroupName $resourceGroupName -CapacityName $capacityName -SkuName $capacityMode
}
