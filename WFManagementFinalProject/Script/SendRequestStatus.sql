CREATE PROCEDURE SendRequestStatus
(
	@EmpId int ,
	@ManagerStatus  varchar(255),
	@ManagerComment varchar(255)
)
AS
BEGIN
	DECLARE @LockId int
	Select @LockId = LockId FROM Employee where EmpId = @EmpId
	UPDATE SoftLock
	SET
		IsLocked = CASE WHEN @ManagerStatus = 'Unlock' THEN 0 Else 1 END,
		LockStatus = @ManagerStatus,
		LastUpdatedDate = GETDATE() ,
		ManagerLastUpdatedDate = GETDATE(),
		ManagerComment = @ManagerComment
	WHERE
	LockId = @LockId 
END