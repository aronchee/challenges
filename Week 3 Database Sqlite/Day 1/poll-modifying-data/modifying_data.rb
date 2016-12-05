# Paste all your sql queries here.
4999|Giovanni|Effertz|male|republican|2|22|0|5|1|0|2012-10-10 16:25:32 -0700|2012-10-10 16:25:32 -0700
5000|Jermey|Emard|female|green|58|73|1|5|1|0|2012-10-10 16:25:32 -0700|2012-10-10 16:25:32 -0700
5001|Mayuyu|Watanabe|female|Democrat|8|22|0|0|1|1|2016-11-01 16:27:55|2016-11-01 16:27:55
5002|Sakuratan|Miyawaki|femmale|Democrat|5|26|0|0|1|1|2016-11-01 16:28:06|2016-11-01 16:28:06

INSERT INTO voters
(first_name, last_name, gender,party, party_duration, age, married, children_count, homeowner, employed,created_at, updated_at)
VALUES
('Mayuyu', 'Watanabe', 'female', 'Democrat', 8, 22, 0, 0, 1, 1, DATETIME('now'), DATETIME('now'));

INSERT INTO voters
(first_name, last_name, gender,party, party_duration, age, married, children_count, homeowner, employed,created_at, updated_at)
VALUES
('Sakuratan', 'Miyawaki', 'femmale', 'Democrat', 5, 26, 0, 0, 1, 1, DATETIME('now'), DATETIME('now'));


INSERT INTO votes (voter_id, politician_id, created_at, updated_at)
VALUES (5001, 224, DATETIME('now'), DATETIME('now'));

INSERT INTO votes (voter_id, politician_id, created_at, updated_at)
VALUES (5002, 230, DATETIME('now'), DATETIME('now'));

UPDATE congress_members SET name = 'Donald Trump' WHERE id =102; 

DELETE FROM voters WHERE voters.id IN ( SELECT voters.id FROM votes JOIN voters ON votes.voters_id = voters.id WHERE party !='republican' AND party != 'democrat' GROUP BY votes.voter_id HAVING COUNT(voter_id)=1); 


DELETE FROM voters WHERE voters.id IN ( SELECT voters.id FROM votes JOIN voters ON votes.voter_id = voters.id JOIN congress_members ON votes.politician_id = congress_members.id  WHERE voters.party !='republican' AND voters.party != 'democrat' AND voters.party_duration < 3 AND congress_members.grade_current > 12 ); 

UPDATE votes
SET politician_id = 346 WHERE votes.voter_id IN (SELECT votes.voter_id FROM votes JOIN voters on votes.voter_id = voters.id WHERE voters.age > 80 AND voters.children_count = 0); 