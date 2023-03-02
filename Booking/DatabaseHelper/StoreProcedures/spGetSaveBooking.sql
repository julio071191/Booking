
CREATE PROCEDURE spGetSaveBooking 
	@id int,
	@Email varchar(80),
	@Checkin date,
	@Checkout date,
	@Adults int,
	@Kids int,
	@Nights int,
	@Cost int,
	@Total int
AS
BEGIN
	SET NOCOUNT ON;
	insert into SaveBooking
		(id,
		Email,
		Checkin,
		Checkout,
		Adults,
		Kids,
		Nights,
		Cost,
		Total)
		
	values 
	
		(@id,
		@Email,
		@Checkin,
		@Checkout,
		@Adults,
		@Kids,
		@Nights,
		@Cost,
		@Total)
END
GO
