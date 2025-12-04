DECLARE @DataBaseName nvarchar(48) = 'DataWarehouse'
DECLARE @SQLCreationCode nvarchar(MAX) 

IF DB_ID(@DataBaseName) IS NULL
BEGIN
	BEGIN TRY
		SET @SQLCreationCode = 'CREATE DATABASE ' + @DataBaseName
		exec sp_executesql @SQLCreationCode
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
	END CATCH
END 
ELSE
BEGIN
	DECLARE @CreationDate as datetime = (SELECT create_date FROM sys.databases WHERE database_id=DB_ID(@DataBaseName))
	PRINT 'The database has already been created at:' + CAST(@CreationDate as varchar)
END