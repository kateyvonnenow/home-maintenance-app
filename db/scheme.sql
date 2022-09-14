CREATE DATABASE home_maintenance;
\c home_maintenance

CREATE TABLE work_orders(
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    image_url TEXT
);

INSERT INTO work_orders(name, description, image_url)
VALUES('Shower Tap Fix Enquiry', 'Hi, I am need of a handyman to fix my shower tap. I found this app and decided to give it a go. I was hoping to get it done this weekend.', 'https://media-cdn.tripadvisor.com/media/photo-s/0c/a9/a8/d3/the-broken-bathroom-shower.jpg');

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

ALTER TABLE users ADD COLUMN password_digest TEXT;

ALTER TABLE users ADD COLUMN admin BOOLEAN;

ALTER TABLE work_orders ADD COLUMN job_status TEXT;

UPDATE work_orders SET job_status = 'waiting' WHERE id = 1;

ALTER TABLE work_orders ALTER COLUMN client_id TYPE NUMERIC USING client_id::NUMERIC;

DELETE FROM work_orders WHERE id = 4;

SELECT * FROM work_orders WHERE client_id = 1 ORDER BY id

