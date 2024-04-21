-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample users
INSERT INTO Users (username, password_hash, email) VALUES
('raja', 'password1_hash', 'user1@example.com'),
('user2', 'password2_hash', 'user2@example.com');

-- Chat Rooms Table
CREATE TABLE ChatRooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(100) NOT NULL,
    created_by INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Users(user_id)
);

-- Insert some sample chat rooms
INSERT INTO ChatRooms (room_name, created_by) VALUES
('General', 1),
('Random', 2);

-- Messages Table
CREATE TABLE Messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    room_id INT NOT NULL,
    user_id INT NOT NULL,
    message_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES ChatRooms(room_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert some sample messages
INSERT INTO Messages (room_id, user_id, message_content) VALUES
(1, 1, 'Hello, everyone!'),
(1, 2, 'Hi there!'),
(2, 1, 'This is a random message.'),
(2, 2, 'Indeed!');

-- User_Rooms Table (Many-to-Many Relationship)
CREATE TABLE User_Rooms (
    user_id INT,
    room_id INT,
    PRIMARY KEY (user_id, room_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES ChatRooms(room_id)
);

-- Insert some sample user-room associations
INSERT INTO User_Rooms (user_id, room_id) VALUES
(1, 1),
(1, 2),
(2, 2);
