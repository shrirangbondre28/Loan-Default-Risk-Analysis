SELECT * FROM loan_clean

SELECT COUNT(*) FROM loan_clean
SELECT IsDefault,
CASE WHEN IsDefault = TRUE THEN 1 ELSE 0 END
FROM loan_clean

--Default Rate by Income Band 
-- "do lower-income borrowers default more?"
SELECT
    incomeband,
    COUNT(*) AS total_loans,
    SUM(CAST(IsDefault AS INT)) AS total_defaults,
    ROUND(AVG(CAST(IsDefault AS INT)) * 100, 2) AS default_rate_pct,
    ROUND(AVG(income), 0) AS avg_income,
    ROUND(AVG(dtiratio), 3) AS avg_dti
FROM loan_clean
GROUP BY incomeBand
ORDER BY default_rate_pct DESC;

--Default Rate by Employment Type
SELECT
    employmenttype,
    COUNT(*) AS total_loans,
    ROUND(AVG(CAST(IsDefault AS INT)) * 100, 2) AS default_rate_pct,
    ROUND(AVG(interestRate), 2) AS avg_rate_charged
FROM loan_clean
GROUP BY employmenttype
ORDER BY default_rate_pct DESC;


--Default Rate by Loan Purpose
SELECT
    loanPurpose,
    COUNT(*) AS total_loans,
    ROUND(AVG(CAST(IsDefault AS INT)) * 100, 2) AS default_rate_pct,
    ROUND(AVG(loanAmount), 0) AS avg_loan_amount
FROM loan_clean
GROUP BY loanPurpose
ORDER BY default_rate_pct DESC;


--Default Rate by Risk Tier
SELECT
    RiskTier,
    COUNT(*) AS customers,
    ROUND(AVG(CAST(IsDefault AS INT)) * 100, 2) AS default_rate_pct,
    ROUND(AVG(CreditScore), 0) AS avg_credit_score,
    ROUND(AVG(DTIRatio), 3) AS avg_dti
FROM loan_clean
GROUP BY RiskTier
ORDER BY default_rate_pct;


--top 10 High Risk Customer Profiles
SELECT
    CreditBand,
    DTIBand,
    EmploymentType,
    IncomeBand,
    COUNT(*) AS customers,
    ROUND(AVG(CAST(IsDefault AS INT)) * 100, 2) AS default_rate_pct
FROM loan_clean
GROUP BY CreditBand, DTIBand, EmploymentType, IncomeBand
HAVING COUNT(*) >= 100
ORDER BY default_rate_pct DESC
LIMIT 10;


--Cohor Analysis
SELECT
    LoanYear,
    COUNT(*) AS loans_originated,
    SUM(CAST(IsDefault AS INT)) AS defaults,
    ROUND(AVG(CAST(IsDefault AS INT)) * 100, 2) AS default_rate_pct,
    ROUND(AVG(CreditScore), 0) AS avg_credit_score,
    ROUND(AVG(InterestRate), 2) AS avg_rate
FROM loan_clean
GROUP BY LoanYear
ORDER BY LoanYear;


--portfolio risk summary
SELECT
    RiskTier,
    COUNT(*) AS customers,
    ROUND(SUM(LoanAmount) / 1000000, 1) AS total_exposure_millions,
    ROUND(AVG(CAST(IsDefault AS INT)) * 100, 2) AS default_rate_pct,
    ROUND(SUM(CAST(IsDefault AS INT)) * AVG(LoanAmount) / 1000000, 1)
        AS expected_loss_millions
FROM loan_clean
GROUP BY RiskTier
ORDER BY default_rate_pct;
