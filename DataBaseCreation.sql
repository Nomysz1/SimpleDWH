DECLARE @DataBaseName nvarchar(48) = 'DWH'
DECLARE @SQLCreationCode nvarchar(MAX) = 'CREATE DATABASE ' + @DataBaseName

IF DB_ID(@DataBaseName) IS NULL
BEGIN
	BEGIN TRY
		exec sp_executesql @SQLCreationCode
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
	END CATCH
END 