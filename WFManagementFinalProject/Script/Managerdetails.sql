ALTER PROCEDURE Managerdetails
AS
BEGIN
	SELECT 
		emp.EmpId,
		emp.EmpName,
		sk.SkillName,
		emp.Profile,
		emp.Experience,
		emp.ManagerName,
		sftlck.IsLocked,
		sftlck.LockId
	FROM Employee emp
	 JOIN SkillMap skm ON skm.EmpId  = emp.EmpId 
	 JOIN Skill sk ON skm.SkillId = sk.SkillId 
	 JOIN SoftLock sftlck ON sftlck.LockId = emp.LockId
	where sftlck.IsLocked = 1
END


EXEC Managerdetails