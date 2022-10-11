CREATE PROCEDURE LoginUser
(
	@UserName  varchar(255),
	@Password  varchar(255)
)
AS
BEGIN
	SELECT 
	UserName,
	Password,
	FirstName,
	Role
	Email FROM [User]
	WHERE
	UserName = @UserName AND Password = @Password 
END