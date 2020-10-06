$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$PDC = ($domainObj.PdcRoleOwner).Name
$SearchString = "LDAP://"
$SearchString += $PDC + "/"
$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"
$SearchString += $DistinguishedName
$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$Searcher.SearchRoot = $objDomain
$Searcher.filter="objectCategory=computer"
$Result = $Searcher.FindAll()
# $Result.Properties.operatingsystem
Foreach($obj in $Result)
{
  If ($obj.Properties.operatingsystem -match 'Windows 10') {
      Foreach($prop in $obj.Properties) {
        $prop
      }
  }
}
