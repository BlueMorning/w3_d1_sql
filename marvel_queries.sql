-- ## Questions
--
-- 1. Return ALL the data in the 'movies' table.
select id, title, year, show_time from movies;

-- 2. Return ONLY the name column from the 'people' table
select name from people;

-- 3. Oops! Someone at CodeClan spelled Lorna's name wrong! Change it to reflect the proper spelling (Noble)
update people set name = 'Lorna Noble-Prize' where id = (select id from people where name = 'Lorna Nobel-Prize');

-- 4. Return ONLY your name from the 'people' table.
select name from people where people.id = 7;
select name from people where people.name like '%Carles';

-- 5. The cinema is showing 'Batman Begins', but Batman is DC, not Marvel! Delete the entry from the 'movies' table.
delete from movies where movies.title = 'Batman Begins';

-- 6. Create a new entry in the 'people' table with the name of one of the instructors
insert into people (name) values ("John");

-- 7. Alex has decided to hijack our movie evening, Remove him from the table of people.
delete from people where people.name = 'Alex Bazlinton';


-- 8. The cinema has just heard that they will be holding an exclusive midnight showing of 'Guardians of the Galaxy 2'!! Create a new entry in the 'movies' table to reflect this.
insert into movies (title) values ('Guardians of the Galaxy 2');


-- 9. The cinema would also like to make the Guardian movies a back to back feature. Update the 'Guardians of the Galaxy' show time from 17:55 to 21:30
update movies set year = 2017, show_time = '21:30' where movies.title = 'Guardians of the Galaxy';


-- ## Extension
--
-- 1. Research how to delete multiple entries from your table in a single command.
delete from movies where year < 2010;
delete from movies where title like 'Avengers%';
delete from movies where title in ('Doctor Strange', 'Thor');



-- ## Extra Extension
--
-- - see the extended_homework folder
