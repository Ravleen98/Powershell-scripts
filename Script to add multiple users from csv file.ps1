$ADUSers = Import-csv C:\Powershell\newadusers.csv
foreach ($user in $ADUSers)
{
    $username = $user.username
    $password = $user.password
    $firstname = $user.firstname
    $lastname =$user.lastname
    $OU= $user.ou
    $email = $user.email
    $streetaddress = $user.streetaddress
    $city =$user.city
    $zipcode = $user.zipcode
    $state =$user.state
    $country= $user.country
    $description = $user.description
    $office = $user.office
    $telephone =$user.telephone
    $jobtitle = $user.jobtitle
    $company =$user.company
    $department= $user.department
    $password = $user.password
 
 #check if user already exist in ad
 if(get-aduser -F {SamAccountName - eq $username})
 {
       Write-Warning "User account already exists."

 }

    else
    {
        new-aduser
            -samaccountname $username
            -UserPrincipalname $username
            -Name $firstname,$lastname
            -GivenName $firstname,$lastname
            -Surname $lastname
            -DisplayName $firstname,$lastname
            -Enabled $True
            -Path $OU
            -City $city
            -COmpany $company
            -State $state
            -StreetAddress $streetaddress
            -officephone $telephone
            -Emailaddress $email
            -Title $jobtitle
            -Department $department
            -AccountPassword (ConvertTo-SecureString $Password =AsPlainText -Force) -ChangePasswordatLogon $True
            -country $country
            -description $description
            -office $office

    }

}
        
