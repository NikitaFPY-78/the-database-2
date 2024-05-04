select title, duration / 60,duration % 60 from track
order by duration desc 
limit 1;

select title, duration / 60,duration % 60 from track
where duration >= 3.5 * 60
order by duration desc;

select title from collection 
where years between 2018 and 2020;

select name from artist
where name not like '% %';

select title from track
where lower(title) like '%мой%';

select COUNT(artistid), title from gengelartist g
left join gengel j on g.gengelid = j.id
group by title;

select COUNT(g.id)  from track g
left join albums j on g.albumid = j.id
where j.year_of_release between 2019 and 2020;

select AVG(duration),j.title  from track g
left join albums j on g.albumid = j.id
group by j.title;

select a.name from artist a
join artistalbums b on a.id = b.artistid
join albums c on b.albumsid = c.id
where c.year_of_release !=2020
group by a.name;

select a.title from collection a
left join collectiontrack b on  b.collectionid = a.id
left join track c on  c.id = b.trackid 
left join albums d on d.id = c.albumid
left join artistalbums e on  e.artistid = d.id
left join artist f on  f.id = e.artistid
where f.name like 'Ки%'
group by a.title;

