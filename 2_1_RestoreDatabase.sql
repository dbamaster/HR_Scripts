--------------------------------------------------------------------------------- 
-- DEMO 2 --
-- Restore HR database from production
---------------------------------------------------------------------------------

-- Get backup metadata (optional)
--RESTORE FILELISTONLY FROM DISK = '/db_scripts/backups/hr_20191106.bak';

-- Restore database using shared folder
SET NOCOUNT ON

USE master
GO
BEGIN TRY  
    RESTORE DATABASE HumanResources
    FROM DISK = '/db_scripts/backups/hr_backup.bak'
    WITH MOVE 'HumanResources_data' TO '/mssql_data/HR.mdf',
    MOVE 'HumanResources_log' TO '/mssql_log/HR_log.ldf',
    NOUNLOAD,
    REPLACE,
    STATS = 5; 
END TRY 
BEGIN CATCH  
        THROW; 
END CATCH

SELECT 'HR database was succesfully restored'
