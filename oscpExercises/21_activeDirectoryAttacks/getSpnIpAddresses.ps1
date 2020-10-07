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
$IpArray = @()
Foreach($obj in $Result)
{
    # Write-Host "serviceprincipalname:" $obj.Properties.serviceprincipalname
    $inputString = $obj.Properties.serviceprincipalname
    $SpnArray = $InputString.Split(" ").Split("/")
    Foreach($obj in $SpnArray)
    {
        If ($obj -match '.corp.com' -and $IpArray -notcontains $obj)  {
            # $obj
            $IpArray += $obj
        }
    }
}

Write-Host "---------- List of SPN server names ----------"
$IpArray

Write-Host "---------- nslookup ----------" 
Foreach($i in $IpArray)
{
    Write-Host "Performing nslookup for $i ...."
    nslookup $i.Split(":")[0]
}
