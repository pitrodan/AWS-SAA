Import-Module AWS.Tools.S3

$region = "us-east-1"

$bucketName = Read-Host -Prompt 'Enter Bucket Name'

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

function BucketExits{
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}
    


if( -not (BucketExits)){

    Write-Host "Bucket does not exists"
    New-S3Bucket -BucketName $bucketName -Region $region

}
else{
    Write-Host "Bucket already exists"
}

#Create new file

$fileName = 'myfile.txt'
$fileContent = "Hello World"
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key fileName
