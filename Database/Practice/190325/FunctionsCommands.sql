-- String Functions
select UPPER('asdfg') as TraineeInUpper

select LOWER('ASDHJD')

select LEN('asdfg')
select CONCAT('Venkata',' ','Krishnan') as FullName
select REVERSE('Venkata') as reverseName
select REPLACE('Venkata Krishnan','Krishnan','K') as Replaced

--Math Functions
select POWER(10,2)
select ABS(-25.0252)
select SQRT(5)
select PI()

-- Date Functions
select GETDATE()
select SYSDATETIME()

select SYSDATETIMEOFFSET()

select ISDATE('2025-1-26')

select MONTH('2020-05-08')
select DAY('2025-5-16')
select YEAR('1999-12-5')