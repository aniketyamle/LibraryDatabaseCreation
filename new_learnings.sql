

SELECT @@version;

-- adds an interval value to a given date
select adddate('2022-11-10', interval 4 year);

-- gives difference between today and a past date
select date(now()) - date('2022-11-10');

select date('2022-11-10');

select now();