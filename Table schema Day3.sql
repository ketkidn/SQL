CREATE TABLE Destinations (
    DestinationID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Country NVARCHAR(100),
    PopularityRank INT,
    EstablishedYear INT NULL
);

INSERT INTO Destinations VALUES
(1, 'Paris', 'France', 1, 1250),
(2, 'New York', 'USA', 2, 1609),
(3, 'London', 'UK', 3, 43),
(4, 'Tokyo', 'Japan', 4, 1457),
(5, 'Sydney', 'Australia', 5, NULL),
(6, 'Rome', 'Italy', 6, 753),
(7, 'Dubai', 'UAE', 7, 1833),
(8, 'Bali', 'Indonesia', 8, 990),
(9, 'Miami', 'USA', 2, 1609), -- Duplicate
(10, 'Cairo', 'Egypt', 10, NULL); -- NULL value

CREATE TABLE Travelers (
    TravelerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Email NVARCHAR(100) UNIQUE,
    PreferredDestinationID INT NULL
);

INSERT INTO Travelers VALUES
(1, 'Alice Johnson', 29, 'alice@mail.com', 1),
(2, 'Bob Smith', 35, 'bob@mail.com', 2),
(3, 'Charlie Brown', 40, 'charlie@mail.com', 3),
(4, 'David Lee', 28, NULL, NULL), -- NULL Email and Destination
(5, 'Emma Davis', 32, 'emma@mail.com', 5),
(6, 'Frank Martin', 45, 'frank@mail.com', 6),
(7, 'Grace White', 26, 'grace@mail.com', 7),
(8, 'Hannah Green', 38, 'hannah@mail.com', 8),
(9, 'Emma', 32, 'ema@mail.com', 5), -- Duplicate Name and Email
(10, 'Isaac Hall', NULL, 'isaac@mail.com', 10); -- NULL Age

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    TravelerID INT,
    DestinationID INT,
    BookingDate DATE,
    Price DECIMAL(10,2)
);

INSERT INTO Bookings VALUES
(1, 1, 1, '2024-01-10', 1200.50),
(2, 2, 2, '2024-02-15', 900.00),
(3, 3, 3, '2024-03-20', 1100.75),
(4, 4, 4, '2024-04-05', NULL), -- NULL Price
(5, 5, 5, '2024-05-10', 850.00),
(6, 6, 6, '2024-06-15', 1000.00),
(7, 7, 7, '2024-07-20', 950.25),
(8, 8, 8, '2024-08-25', 1200.00),
(9, 9, 2, '2024-02-15', 900.00), -- Duplicate booking
(10, 10, 10, NULL, 700.00); -- NULL BookingDate

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    TravelerID INT,
    DestinationID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText NVARCHAR(500) NULL
);

INSERT INTO Reviews VALUES
(1, 1, 1, 5, 'Amazing experience!'),
(2, 2, 2, 4, 'Great city, but crowded.'),
(3, 3, 3, 5, 'Loved the history and culture.'),
(4, 4, 4, 3, 'Good but too expensive.'),
(5, 5, 5, 4, NULL), -- NULL ReviewText
(6, 6, 6, 5, 'Perfect trip!'),
(7, 7, 7, 2, 'Not as expected.'), -- Low rating
(8, 8, 8, 5, 'Breathtaking views!'),
(9, 9, 2, 4, 'Would visit again.'), -- Duplicate destination review
(10, 10, 10, NULL, 'No comments.'); -- NULL Rating
