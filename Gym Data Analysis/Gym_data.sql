select
	m.name as member_name,
	p.plan_name
from members m
join memberships ms on m.member_id = ms.member_id
join plans p on ms.plan_id = p.plan_id

-- Total members
SELECT COUNT(*) FROM members;

-- Most active members
SELECT m.name, COUNT(c.checkin_id) AS visits
FROM members m
JOIN check_ins c ON m.member_id = c.member_id
GROUP BY m.name
ORDER BY visits DESC;

-- Members who never checked in
SELECT m.name
FROM members m
LEFT JOIN check_ins c ON m.member_id = c.member_id
WHERE c.checkin_id IS NULL;

-- Total revenue
SELECT SUM(p.price) AS total_revenue
FROM memberships ms
JOIN plans p ON ms.plan_id = p.plan_id;

-- Most popular plan
SELECT p.plan_name, COUNT(*) AS total
FROM memberships ms
JOIN plans p ON ms.plan_id = p.plan_id
GROUP BY p.plan_name
ORDER BY total DESC;

-- Members with active memberships
SELECT m.name, p.plan_name, ms.end_date
FROM members m
JOIN memberships ms ON m.member_id = ms.member_id
JOIN plans p ON ms.plan_id = p.plan_id
WHERE ms.end_date >= CURRENT_DATE;

-- Members with expired memberships
SELECT m.name, ms.end_date
FROM members m
JOIN memberships ms ON m.member_id = ms.member_id
WHERE ms.end_date < CURRENT_DATE;

-- Members who NEVER checked in
SELECT m.name
FROM members m
LEFT JOIN check_ins c ON m.member_id = c.member_id
WHERE c.checkin_id IS NULL;

-- Most active members (top 5)
SELECT m.name, COUNT(c.checkin_id) AS visits
FROM members m
JOIN check_ins c ON m.member_id = c.member_id
GROUP BY m.name
ORDER BY visits DESC
LIMIT 5;

-- Members inactive in last 30 days
SELECT m.name
FROM members m
LEFT JOIN check_ins c 
ON m.member_id = c.member_id 
AND c.check_in_time >= NOW() - INTERVAL '30 days'
WHERE c.checkin_id IS NULL;

-- Total revenue
SELECT SUM(p.price) AS total_revenue
FROM memberships ms
JOIN plans p ON ms.plan_id = p.plan_id;

-- Most popular plan
SELECT p.plan_name, COUNT(*) AS total_members
FROM memberships ms
JOIN plans p ON ms.plan_id = p.plan_id
GROUP BY p.plan_name
ORDER BY total_members DESC
LIMIT 1;

-- Trainer performance (sessions count)
SELECT t.name, AVG(s.duration_minutes) AS avg_duration
FROM trainers t
JOIN sessions s ON t.trainer_id = s.trainer_id
GROUP BY t.name;

-- Average session duration per trainer
SELECT t.name, AVG(s.duration_minutes) AS avg_duration
FROM trainers t
JOIN sessions s ON t.trainer_id = s.trainer_id
GROUP BY t.name;