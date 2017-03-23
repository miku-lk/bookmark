create table items(
  id int auto_increment primary key not null,
  name varchar(32) not null default 'unknown user',
  url text not null,
  posted timestamp not null default current_timestamp
)