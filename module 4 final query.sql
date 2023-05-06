SELECT LoanNr_ChkDgt, Name, ApprovalDate, Term, GrAppv, MIS_Status,
       CASE
          WHEN MIS_Status = 'P I F' AND Term >= 36 AND CAST(REPLACE(REPLACE(GrAppv, ',', ''), '$', '') AS NUMERIC) <= 100000 THEN 'Approved'
          ELSE 'Declined'
       END AS Eligibility
FROM Loan;

SELECT LoanNr_ChkDgt, Name, BalanceGross, MIS_Status,
    RANK() OVER (ORDER BY BalanceGross DESC) AS balance_rank
FROM Loan
WHERE MIS_Status = 'P I F' AND ChgOffDate IS NULL AND DATE_PART('year', AGE(CURRENT_DATE, DisbursementDate)) <= 2
ORDER BY balance_rank
LIMIT 5;


SELECT LoanNr_ChkDgt, Name, BalanceGross, MIS_Status,
    CASE
        WHEN MIS_Status = 'CHGOFF' THEN 'Declined'
        WHEN BalanceGross >= 50000 THEN 'Approved'
        ELSE 'Undecided'
    END AS LoanEligibility
FROM (
    SELECT LoanNr_ChkDgt, Name, BalanceGross, MIS_Status,
        RANK() OVER (ORDER BY BalanceGross DESC) AS balance_rank
    FROM Loan
    WHERE MIS_Status = 'P I F' AND ChgOffDate IS NULL AND DATE_PART('year', AGE(CURRENT_DATE, DisbursementDate)) <= 2
) AS top_customers
ORDER BY balance_rank
LIMIT 5;

SELECT LoanNr_ChkDgt, Name, ApprovalDate, Term, GrAppv, BalanceGross, MIS_Status,
       CASE
          WHEN MIS_Status = 'P I F' AND Term >= 36 AND CAST(REPLACE(REPLACE(GrAppv, ',', ''), '$', '') AS NUMERIC) <= 100000 AND CAST(REPLACE(REPLACE(BalanceGross, ',', ''), '$', '') AS NUMERIC) >= 50000 THEN 'Approved'
          ELSE 'Declined'
       END AS Eligibility
FROM Loan;
ABORT




SELECT REPLACE(BalanceGross, '$', '') FROM Loan;

SELECT LoanNr_ChkDgt, Name, BalanceGross, MIS_Status,
    CASE
        WHEN MIS_Status = 'CHGOFF' THEN 'Declined'
        WHEN BalanceGross::numeric >= 50000 THEN 'Approved'
        ELSE 'Undecided'
    END AS LoanEligibility
FROM (
    SELECT LoanNr_ChkDgt, Name, BalanceGross, MIS_Status,
        RANK() OVER (ORDER BY BalanceGross DESC) AS balance_rank
    FROM Loan
    WHERE MIS_Status = 'P I F' AND ChgOffDate IS NULL AND DATE_PART('year', AGE(CURRENT_DATE, DisbursementDate)) <= 2
) AS top_customers
ORDER BY balance_rank
LIMIT 5;


UPDATE Loan
SET BalanceGross = REPLACE(REPLACE(BalanceGross, '$', ''), ',', '')
WHERE NOT BalanceGross ~ '^-?[0-9]*\.?[0-9]+$';

SELECT LoanNr_ChkDgt, Name, BalanceGross, MIS_Status,
    CASE
        WHEN MIS_Status = 'CHGOFF' THEN 'Declined'
        WHEN BalanceGross::numeric >= 50000 THEN 'Approved'
        ELSE 'Undecided'
    END AS LoanEligibility
FROM (
    SELECT LoanNr_ChkDgt, Name, BalanceGross, MIS_Status,
        RANK() OVER (ORDER BY BalanceGross DESC) AS balance_rank
    FROM Loan
    WHERE MIS_Status = 'P I F' AND ChgOffDate IS NULL AND DATE_PART('year', AGE(CURRENT_DATE, DisbursementDate)) <= 2
) AS top_customers
ORDER BY balance_rank
LIMIT 5;



								 
