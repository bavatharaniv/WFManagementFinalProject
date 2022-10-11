CREATE PROCEDURE WfmMemberLoginDetails
(
	@UserName varchar(255)
)
AS
BEGIN
	SELECT
		emp.EmpId,
		sftlck.RequestedManager,
		sftlck.RequestedDate,
		emp.ManagerName,
		sftlck.RequestMessage
	FROM
	Employee emp
	JOIN SoftLock sftlck On sftlck.LockId = emp.LockId
	WHERE emp.wfm_MemberName = @UserName	
END