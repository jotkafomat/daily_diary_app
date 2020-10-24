CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), diary_entry_id INTEGER REFERENCES diary_entries (id));
