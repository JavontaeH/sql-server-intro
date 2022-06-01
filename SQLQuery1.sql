-- Query all of the entries in the Genre table
select * from Genre;

-- Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
select * from artist
order by artist.ArtistName;

-- Write a SELECT query that lists all the songs in the Song table and include the Artist name
select s.*, a.artistname
from song s
join artist a on a.Id = s.ArtistId;

-- Write a SELECT query that lists all the Artists that have a Soul Album
select distinct a.ArtistName
from artist a
join album al on al.ArtistId = a.id
join genre g on g.id = al.GenreId
where g.Name = 'soul';


-- Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
select distinct a.ArtistName
from artist a
join album al on al.ArtistId = a.id
join genre g on g.id = al.GenreId
where g.Name = 'jazz' or g.Name = 'rock';

-- Write a SELECT statement that lists the Albums with no songs
select al.Title
from album al
left join Song s on s.AlbumId = al.id
where s.Id is NULL ;


-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select al.Title, COUNT(s.id) as 'number of songs'
from album al 
left join song s on s.albumid = al.id
group by al.Id, al.title;


-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select a.ArtistName, Count(s.Id) as 'number of songs'
from artist a
left join song s on a.id = s.ArtistId
group by a.Id, a.ArtistName;

-- Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
select a.ArtistName
from Artist a 
join album al on al.ArtistId = a.id
group by a.ArtistName
having count(distinct al.Label) > 1;

-- Using ORDER BY and TOP 1, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select top 1 *
from Album
order by AlbumLength


