CREATE PROCEDURE LockStatusManagerChange
(
	@LockId int,
	@RequestMessage varchar(255),
	@FirstName varchar(50)
)
AS
BEGIN
	UPDATE SoftLock
	SET
		RequestedDate = GETDATE(),
		LockStatus = 'Pending',
		RequestMessage = @RequestMessage,
		LastUpdatedDate = GETDATE(),
		RequestedManager = @FirstName
	WHERE
	LockId = @LockId 
END