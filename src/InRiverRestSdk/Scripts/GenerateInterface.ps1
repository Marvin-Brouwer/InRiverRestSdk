
$SwaggerDoc = "https://apieuw.productmarketingcloud.com/swagger/v1/swagger.json";
$GeneratedClientFile = "${PSScriptRoot}\..\Client.g.cs";

& dotnet tool run refitter $SwaggerDoc `
--use-iso-date-format `
--namespace "InRiverRestSdk"  `
--multiple-interfaces ByTag  `
--optional-nullable-parameters `
--output $GeneratedClientFile;

# Generate a hash so the pipeline can compare this with a previous version
$HashedOutput = Get-FileHash($GeneratedClientFile);
Out-File `
  -FilePath "${GeneratedClientFile}.hash" `
  -InputObject $HashedOutput.Hash;