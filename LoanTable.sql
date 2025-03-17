use library_group_3;

-- Loan table
CREATE TABLE Loan
(
    LoanID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    CopyID INT NOT NULL,
    FOREIGN KEY (CopyID) REFERENCES Copy(CopyID),
    BorrowDate DATE NOT NULL DEFAULT (CURDATE()),
    ReturnDate DATE NULL,
    CHECK (ReturnDate IS NULL OR ReturnDate >= BorrowDate)
);

INSERT INTO Loan(UserID, CopyID, BorrowDate, ReturnDate)
VALUES (1, 2, '2025-03-03', NULL),
(4, 6, '2025-02-24', '2025-03-08'),
(4, 3, '2025-02-24', '2025-03-08'),
(4, 7, '2025-02-24', '2025-03-08'),
(6, 3, '2025-02-15', '2025-03-05'),
(6, 1, '2025-02-15', '2025-03-05'),
(5, 1, '2025-03-07', NULL),
(7, 4, '2025-02-24', NULL),
(8, 7, '2025-02-28', NULL);

drop table loan;
select *
from loan;

