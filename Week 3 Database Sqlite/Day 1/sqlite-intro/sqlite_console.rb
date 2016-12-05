# Paste all your previous commands from the SQLite console here.

nextacademy@nextacademy-VirtualBox:~$ cat << EOF > ~/.sqliterc
> .headers on
> .mode column
> EOF
nextacademy@nextacademy-VirtualBox:~$ sqlite3 dummy.db
-- Loading resources from /home/nextacademy/.sqliterc

SQLite version 3.11.0 2016-02-15 17:29:24
Enter ".help" for usage hints.
sqlite> CREATE TABLE users (
   ...> id INTEGER PRIMARY KEY AUTOINCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL
   ...> );
sqlite> INSERT INTO users
   ...> (first_name, last_name, email, created_at, updated_at)
   ...> VALUES
   ...> ('Joshua', 'Teng', 'jedicoder@example.com', DATETIME('now'), DATETIME('now'));
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at         
----------  ----------  ----------  ---------------------  -------------------  -------------------
1           Joshua      Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 02:39:09
sqlite> INSERT INTO users
   ...> (first_name, last_name, email, created_at, updated_at)
   ...> VALUES
   ...> ('Aron', 'Chee', 'padawancoder@example.com', DATETIME('now'), DATETIME('now'));
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at         
----------  ----------  ----------  ---------------------  -------------------  -------------------
1           Joshua      Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 02:39:09
2           Aron        Chee        padawancoder@example.  2016-09-21 02:41:07  2016-09-21 02:41:07
sqlite> return
   ...> ;
Error: near "return": syntax error
sqlite> INSERT INTO users
   ...> (first_name, last_name, email, created_at, updated_at)
   ...> VALUES
   ...> ('Jessie', 'Farmers', 'padawancoder@example.com', DATETIME('now'), DATETIME('now'));
Error: UNIQUE constraint failed: users.email
sqlite> ALTER TABLE users
   ...> ADD COLUMN nickname VARCHAR(64) NOT NULL;
Error: Cannot add a NOT NULL column with default value NULL
sqlite> ALTER TABLE users
   ...> (ADD COLUMN nickname VARCHAR(64) NOT NULL);
Error: near "(": syntax error
sqlite> ALTER TABLE users (
   ...> ADD COLUMN nickname VARCHAR(64) NOT NULL);
Error: near "(": syntax error
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at         
----------  ----------  ----------  ---------------------  -------------------  -------------------
1           Joshua      Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 02:39:09
2           Aron        Chee        padawancoder@example.  2016-09-21 02:41:07  2016-09-21 02:41:07
sqlite> ALTER TABLE users ADD COLUMN nickname VARCHAR(64) NOT NULL;
Error: Cannot add a NOT NULL column with default value NULL
sqlite> .schema
CREATE TABLE users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL,
email VARCHAR(128) UNIQUE NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
);
sqlite> ALTER TABLE users ADD COLUMN nickname VARCHAR(64) NOT NULL default 'no nickname yet.';
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at           nickname        
----------  ----------  ----------  ---------------------  -------------------  -------------------  ----------------
1           Joshua      Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 02:39:09  no nickname yet.
2           Aron        Chee        padawancoder@example.  2016-09-21 02:41:07  2016-09-21 02:41:07  no nickname yet.
sqlite> .schema
CREATE TABLE users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL,
email VARCHAR(128) UNIQUE NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
, nickname VARCHAR(64) NOT NULL default 'no nickname yet.');
sqlite> UPDATE users SET nickname = 'pookie butt' WHERE id=1;
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at           nickname   
----------  ----------  ----------  ---------------------  -------------------  -------------------  -----------
1           Joshua      Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 02:39:09  pookie butt
2           Aron        Chee        padawancoder@example.  2016-09-21 02:41:07  2016-09-21 02:41:07  no nickname
sqlite> UPDATE users SET nickname = 'Ninja Coder' WHERE id=1;
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at           nickname   
----------  ----------  ----------  ---------------------  -------------------  -------------------  -----------
1           Joshua      Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 02:39:09  Ninja Coder
2           Aron        Chee        padawancoder@example.  2016-09-21 02:41:07  2016-09-21 02:41:07  no nickname
sqlite> UPDATE users SET first_name = 'Josh' WHERE id=1;
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at           nickname   
----------  ----------  ----------  ---------------------  -------------------  -------------------  -----------
1           Josh        Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 02:39:09  Ninja Coder
2           Aron        Chee        padawancoder@example.  2016-09-21 02:41:07  2016-09-21 02:41:07  no nickname
sqlite> UPDATE users SET updated_at = DATETIME WHERE id=1;
Error: no such column: DATETIME
sqlite> UPDATE users SET updated_at = VALUES(CURRENT_TIMESTAMP) WHERE id=1;
Error: near "VALUES": syntax error
sqlite> UPDATE users SET updated_at = DATETIME(CURRENT_TIMESTAMP) WHERE id=1;
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at           nickname   
----------  ----------  ----------  ---------------------  -------------------  -------------------  -----------
1           Josh        Teng        jedicoder@example.com  2016-09-21 02:39:09  2016-09-21 03:14:22  Ninja Coder
2           Aron        Chee        padawancoder@example.  2016-09-21 02:41:07  2016-09-21 02:41:07  no nickname
sqlite> 
