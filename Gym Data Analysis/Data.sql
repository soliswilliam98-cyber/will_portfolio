-- Members
INSERT INTO members (name, email, phone, join_date)
SELECT
    'Member ' || i,
    'member' || i || '@gmail.com',
    '809-555-' || LPAD(i::text, 4, '0'),
    CURRENT_DATE - (RANDOM() * 365)::INT
FROM generate_series(1, 100) AS s(i);

-- Plans
INSERT INTO plans (plan_name, price, duration_months) VALUES
('Basic', 30.00, 1),
('Standard', 50.00, 2),
('Premium', 80.00, 3),
('VIP', 120.00, 6);

-- Memberships
INSERT INTO memberships (member_id, plan_id, start_date, end_date)
SELECT
    m.member_id,
    (RANDOM() * 3 + 1)::INT,
    CURRENT_DATE - (m.member_id * INTERVAL '1 day'),
    CURRENT_DATE + (m.member_id * INTERVAL '1 day')
FROM members m;

-- Check-ins
INSERT INTO check_ins (member_id, check_in_time)
SELECT
    (RANDOM() * 99 + 1)::INT,
    NOW() - (RANDOM() * INTERVAL '60 days')
FROM generate_series(1, 500);

-- Trainers
INSERT INTO trainers (name, specialty) VALUES
('Carlos Perez', 'Strength'),
('Ana Lopez', 'Cardio'),
('Miguel Santos', 'Crossfit'),
('Laura Diaz', 'Yoga');

-- Sessions
INSERT INTO sessions (trainer_id, member_id, session_date, duration_minutes)
SELECT
    (RANDOM() * 3 + 1)::INT,
    (RANDOM() * 99 + 1)::INT,
    CURRENT_DATE - (RANDOM() * 60)::INT,
    (RANDOM() * 90 + 30)::INT
FROM generate_series(1, 150);