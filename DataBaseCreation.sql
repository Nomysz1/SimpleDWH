DECLARE @DBName as nvarchar(128) = 'DataWarehouse'

IF DB_ID(@DBName) IS NULL
BEGIN
	BEGIN TRY
		DECLARE @SQLScript as nvarchar(64) = 'CREATE DATABASE ' + @DBName
		EXEC sp_executesql @SQLScript
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
	END CATCH
END 
ELSE
BEGIN
	DECLARE @CreationDate as datetime = (SELECT create_date FROM sys.databases WHERE database_id=DB_ID(@DBName))
	PRINT 'The database has already been created at:' + CAST(@CreationDate as varchar)
END