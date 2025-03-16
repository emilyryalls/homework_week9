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

