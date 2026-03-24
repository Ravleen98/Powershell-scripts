# Import Active Directory module
Import-Module ActiveDirectory

# Function to generate a random password
function Generate-RandomPassword {
    $length = 15
    $chars = [char[]]('a'..'z' + 'A'..'Z' + '0'..'9' + '!@#$%^&*()')
    $password = -join ((Get-Random -Count $length -InputObject $chars) | Sort-Object {Get-Random})
    return $password
}

# Set the username and the new random password
$username = "user123"  # Replace with the actual username
$newPassword = Generate-RandomPassword

# Convert the password to a secure string
$securePassword = ConvertTo-SecureString $newPassword -AsPlainText -Force

# Reset the user's password
Set-ADAccountPassword -Identity $username -NewPassword $securePassword -Reset

# Output the new password
Write-Host "The password for user '$username' has been reset to: $newPassword"
