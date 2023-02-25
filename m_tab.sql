CREATE TABLE janres
(
	janre_id serial PRIMARY KEY,
	janres varchar(32) NOT NULL

);


CREATE TABLE performers
(
	performer_id serial PRIMARY KEY,
	performer_name varchar(60)
	
);

CREATE TABLE janre_performer
(
	janre_id int REFERENCES janres(janre_id),
	performer_id REFERENCES performers(performer_id),
	CONSTRAINT janre_performer_pk PRIMARY KEY (janre_id, performer_id) 
);

CREATE TABLE albums
(
	album_id serial PRIMARY KEY,
	album_title varchar(60),
	year_of_issue int NOT NULL
	
);
CREATE TABLE all_tracks
 (
 	track_id serial PRIMARY KEY,
	track_title varchar (60) NOT NULL,
	album int REFERENCES albums(album_id),
	duration real (6)
 );

CREATE TABLE collections
(
	collection_id serial PRIMARY KEY,
	collection_name varchar(32) NOT NULL,
	release_date date NOT NULL
);

CREATE TABLE collection_1
(
	collection_id int REFERENCES collections(collection_id),
	track_id int REFERENCES all_tracks(track_id),
	CONSTRAINT collection_1_pk PRIMARY KEY (collection_id, track_id)
);

CREATE TABLE album_author
(
	album_id int REFERENCES album(album_id),
	performer_id int REFERENCES performers(performer_id)
	CONSTRAINT album_author_pkey PRIMARY KEY (album_id, performer_id)
);
