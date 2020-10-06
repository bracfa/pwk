$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$PDC = ($domainObj.PdcRoleOwner).Name
$SearchString = "LDAP://"
$SearchString += $PDC + "/"
$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"
$SearchString += $DistinguishedName
$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$Searcher.SearchRoot = $objDomain
$Searcher.filter="serviceprincipalname=*"
$Result = $Searcher.FindAll()
Foreach($obj in $Result)
{
    Write-Host "samaccountname      :" $obj.Properties.samaccountname
    Write-Host "serviceprincipalname:" $obj.Properties.serviceprincipalname
    Write-Host "-----------------------------------"
}
