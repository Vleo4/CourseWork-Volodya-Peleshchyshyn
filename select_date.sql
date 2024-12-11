(
	Select
		Date As [Date],
		YEAR(Date) As [Year],
		MONTH(Date) As [Month],
		DAY(Date) As [Day]
	From dbo.Sales
) Union (
	Select
		supply_date As [Date],
		YEAR(supply_date) As [Year],
		MONTH(supply_date) As [Month],
		DAY(supply_date) As [Day]
	From dbo.Supplies
)
