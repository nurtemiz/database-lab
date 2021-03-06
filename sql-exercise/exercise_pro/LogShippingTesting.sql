--dbm_RestoreBAK @rserver='PSQLPA11', @localdir='e:\MSSQL\BAK\',@mdfdrive='E',@ldfdrive='E',@dbs='AddisonAve32',@recovery='0',@output='1'

-- copy bak file by hand to ISQLDEV510
-- run command again w/out the @output = '1'
--dbm_RestoreTRN @rserver='PSQLPA11',@dbs='AddisonAvenue32',@localdir='E:\MSSQL.1\MSSQL\TRN\',@output='1'
---------------------------------------------------------------------------------
Declare @dbname varchar(64)
Declare @rserver varchar(64)
Declare @trnname varchar(128)
Declare @localdir varchar(300)
Declare @trn varchar(1000)
Declare @file varchar(128)
Declare @cmd varchar(8000)
Declare @restore varchar(8000)
Declare @mkdir varchar(1000)
Declare @lpath varchar(300)
Declare @norecovery varchar(16)
Declare @result int
Declare @seltrn varchar(8000)
Declare @output int
Declare @recovery int

Set @dbname = 'AddisonAve32'
Set @rserver='PSQLPA11'
Set @localdir='E:\MSSQL\TRN\'
-------------------------
Set @output = '1'
Set @recovery = '0'


if @recovery = '1'
	Set @norecovery = 'RECOVERY,'
Else
	Set @norecovery = 'NORECOVERY,'


-- update records
exec osqlutil12.status.dbo.ins_LogShipStatus @Server=@rserver,@DB=@dbname

declare trnname cursor FOR
	SELECT message FROM 
	(
		select * from OSQLUTIL12.Status.dbo.logshipstatus where database_name = 'AddisonAve32'
		and sequence_id >= (select max(sequence_id) from OSQLUTIL12.Status.dbo.logshipstatus where database_name = 'AddisonAve32' 
		and activity = 'Backup database'
		and restored = '0')
	) AS TRN
	WHERE message LIKE '%.trn'

open trnname 
	fetch next from trnname into @trnname 
	while @@fetch_status=0 
begin
---------

Set @trn = '\\' + @rserver + '\' + REPLACE(@trnname,':','$')
Set @file = (select distinct r from [dbamaint].[dbo].[udf_split](@trnname,'\') where r like '%.trn')
Set @lpath = @localdir + @dbname + '\' + @file

-- copy trn file with overwrite
select @cmd = 'copy ' + @trn + ' ' + @lpath + ' /Y'  
-- build restore statement
select @restore =	' RESTORE LOG [' + @dbname + ']' + char(13) +
					' FROM DISK = N''' + @lpath  + '''' + char(13) +
					' WITH FILE = 1, ' + @norecovery + ' STATS = 10' + char(13)


IF @output = '0'
	Begin
		-- Run the dir command, put output of xp_cmdshell into @result
		EXEC @result = master.dbo.xp_cmdshell @cmd

		 -- If the directory does not exist, we must create it
		IF @result <> 0
			BEGIN
				-- build the mkdir command
				SELECT @mkdir = 'mkdir ' + @localdir + @dbname
				-- create the directory
				EXEC master.dbo.xp_cmdshell @mkdir, NO_OUTPUT
				-- copy trn file
				EXEC master.dbo.xp_cmdshell @cmd
				-- restore trn
				exec (@restore)
			END
		ELSE
			Begin
				--  file copy succeeded, dir exists, restore db
				exec (@restore)
				--print 'inside restore loop' -- makes the errors stop when no actions happen(commented steps etc)
			End
	End
ELSE
	-- flagged for output, print and exit
	BEGIN
		print '--Selection Statement: ' + char(13) + @seltrn
		print '--Copy Statement: ' + char(13) + @cmd
		print '--Restore Statement: ' + char(13) + @restore
	END

fetch next from trnname into @trnname 
end
 
CLOSE trnname 
DEALLOCATE trnname
---------------------------------------------------------------------------------