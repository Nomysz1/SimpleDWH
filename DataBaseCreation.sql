DECLARE @DataBaseName nvarchar(48) = 'DWH'
DECLARE @SQLCreationCode nvarchar(MAX) 

IF DB_ID(@DataBaseName) IS NULL
BEGIN
	BEGIN TRY
		SET @SQLCreationCode = 'CREATE DATABASE ' + @DataBaseName + CAST(CAST(GETDATE() as int) as varchar)
		exec sp_executesql @SQLCreationCode
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
	END CATCH
END 
ELSE
	PRINT 'The database has already been created.'