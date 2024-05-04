create table if not exists collection(
	id SERIAL primary key,
	title VARCHAR(60) not null,
	years integer CHECK (years > 1700 AND years < 2100)
	);

create table if not exists albums(
	id SERIAL primary key,
	title VARCHAR(60) not null,
	year_of_release integer CHECK (year_of_release > 1700 AND year_of_release < 2100)
	);

create table if not exists track(
	id SERIAL primary key,
	title VARCHAR(60) not null,
	duration integer,
	albumID integer not null references albums(id)
	);
	
create table if not exists gengel(
	id SERIAL primary key,
	title VARCHAR(60) not null
	);

create table if not exists artist(
	id SERIAL primary key,
	name VARCHAR(60) not null
	);

create table if not exists ArtistAlbums(
	albumsID integer references albums(id),
	artistID integer references artist(id),
	constraint pt primary key (albumsID, artistID)
);

create table if not exists GengelArtist(
	artistID integer references artist(id),
	gengelID integer references gengel(id),
	constraint pk primary key (artistID, gengelID)
);

create table if not exists CollectionTrack(
	collectionID integer references collection(id),
	trackID integer references track(id),
	constraint pn primary key (collectionID, trackID)
);