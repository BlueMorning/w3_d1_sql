-- ## Section 1
--
--   This section involves more complex queries.  You will need to go and find out about aggregate funcions in SQL to answer some of the next questions.
--
--   1. Select the names and prices of all shows, ordered by price in ascending order.
--
select name, price from shows order by price asc;


--   10. Select the average price of all shows.
select sum(price)/(select count(price) from shows) from shows;

--   11. Select the price of the least expensive show.
select min(price) from shows;

--   12. Select the sum of the price of all shows.
select sum(price) from shows;
--
--   13. Select the sum of the price of all shows whose prices is less than £20.
select sum(price) from shows where price < 20;

--   14. Select the name and price of the most expensive show.
select name, price from shows where price = (select max(price) from shows);

--   15. Select the name and price of the second from cheapest show.
--
select name, price from shows order by price asc limit 1 offset 1

--   16. Select the names of all users whose names start with the letter "M".
select name from users where name like('%M%');


--   17. Select the names of users whose names contain "er".
select name from users where name like('%er%');
--
-- ## Section 2
--
--   The following questions can be answered by using nested SQL statements but ideally you should learn about JOIN clauses to answer them.
--
--   10. Select the time for the Edinburgh Royal Tattoo.

-- 22:00
select time from times where times.show_id = (select id from shows where shows.name = 'Edinburgh Royal Tattoo');

--   19. Select the number of users who want to see "Shitfaced Shakespeare".
-- 7 users
select count(shows_users.user_id) from shows_users where shows_users.show_id = (select id from shows where shows.name = 'Shitfaced Shakespeare');
--
--   20. Select all of the user names and the count of shows they're going to see.
select count(shows_users.user_id), (select name from users where users.id = shows_users.user_id) from shows_users, users where shows_users.user_id = users.id group by shows_users.user_id order by count(shows_users.user_id) desc;


--   21. SELECT all users who are going to a show at 17:15.
select users.name from users, shows, shows_users, times where
    users.id = shows_users.user_id
and shows.id = shows_users.show_id
and times.show_id = shows.id
and times.time = '17:15';
