CREATE TABLE members (
    member_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

CREATE TABLE plans (
    plan_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    price DECIMAL(9,2) CHECK (price > 0),
    duration_months INT NOT NULL CHECK (duration_months > 0)
);

CREATE TABLE memberships (
    membership_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CHECK (end_date > start_date),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id),
    UNIQUE (member_id, plan_id, start_date)
);

CREATE TABLE check_ins (
    checkin_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT NOT NULL,
    check_in_time TIMESTAMP NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE trainers (
    trainer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50)
);

CREATE TABLE sessions (
    session_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trainer_id INT NOT NULL,
    member_id INT NOT NULL,
    session_date DATE NOT NULL,
    duration_minutes INT NOT NULL CHECK (duration_minutes > 0),
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);