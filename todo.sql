-- create the database
createdb todolist

-- create the table
create table todos (
  id SERIAL PRIMARY KEY,
  title varchar(255) not null,
  details text null,
  priority integer not null default 1,
  created_at timestamp not null,
  completed_at timestamp null
);

-- insert some data into the table
insert into todos (title, priority, created_at) values ('Wash the dog', 2, now());
insert into todos (title, details, priority, created_at) values ('Call the garage','The car needs to go in for an oil change and tire rotation', 3, now());
insert into todos (title, priority, created_at, completed_at) values ('Empty the dishwasher', 1, now(), now());
insert into todos (title, created_at) values ('Vacuum', now());
insert into todos (title,priority, created_at) values ('Buy Groceries', 5, now());

-- find all incomplete todos
select title, priority from todos where completed_at is null;

-- find todos with priority higher than 1
select title, priority from todos where priority > 1;

-- update one item to completed
update todos set completed_at = now() where id = 1;

-- delete all completed todos
delete from todos where completed_at is not null;
