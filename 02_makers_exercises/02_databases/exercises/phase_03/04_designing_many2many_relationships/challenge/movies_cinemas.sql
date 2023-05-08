create table movies (
  id serial primary key,
  title text,
  release_date date
);

create table cinemas (
  id serial primary key,
  location text
);

create table movies_cinemas (
  movie_id int,
  cinema_id int,
  constraint fk_movie foreign key(movie_id) references movies(id) on delete cascade,
  constraint fk_cinema foreign key(cinema_id) references cinemas(id) on delete cascade,
  primary key (movie_id, cinema_id)
);
