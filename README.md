# Loan-Default-Risk-Analysis
.
## Table of Contents
- [Background Overview](#background-overview)
- [Problem Statement](#problem-statement)
- [Data Structure Overview](#data-structure-overview)
- [Tools Used](#tools-used)
- [Project Workflow](#project-workflow)
- [Executive Summary](#executive-summary)
- [Dashboard Report Pages](#dashboard-report-pages)
- [Insights Deep Dive](#insights-deep-dive)
- [Business Recommendations](#business-recommendations)

### Cleaned Dataset: [https://drive.google.com/file/d/18ek4ACXVt_gNUzOVekicW1m3VavBZuQs/view?usp=drive_link]

## Background Overview 
The financial services industry provides loans to customers, but a portion of borrowers fail to repay, resulting in loan defaults and financial losses. This project analyzes borrower financial and behavioral data to identify high risk customer segments and help financial institutions make better credit approval and risk management decisions.

## Problem Statement

### Business objective: 
Banks needs to minimize credit losses while maintaining loan portfolio growth. When borrowers default, bank loses principal and incurs collection costs. The business wants to identify which customer profiles carry high default risk before approving loans.
### Analytical objective: 
Segment the 255K loan portfolio by risk profile using observable characteristics (income, credit score, DTI, employment type) and quantify default rates at each risk level, to produce decision rules for credit approvals, pricing, and marketing targeting.

## Data Structure Overview
The dataset contains 250,000+ loan records with 19 variables describing borrower demographics, financial information, loan details, and repayment status. The target variable is Default, which indicates whether the borrower defaulted on the loan.
| Column Name    | Data Type            | Description                                                |
| -------------- | -------------------- | ---------------------------------------------------------- |
| LoanID         | Categorical (String) | Unique identifier for each loan application                |
| Age            | Numeric (Integer)    | Age of the borrower                                        |
| Income         | Numeric (Integer)    | Annual income of the borrower                              |
| LoanAmount     | Numeric (Integer)    | Total loan amount borrowed                                 |
| CreditScore    | Numeric (Integer)    | Borrower’s credit score indicating creditworthiness        |
| MonthsEmployed | Numeric (Integer)    | Number of months the borrower has been employed            |
| NumCreditLines | Numeric (Integer)    | Total number of credit lines the borrower has              |
| InterestRate   | Numeric (Float)      | Interest rate charged on the loan                          |
| LoanTerm       | Numeric (Integer)    | Loan duration in months                                    |
| DTIRatio       | Numeric (Float)      | Debt-to-Income ratio (Total debt / Income)                 |
| Education      | Categorical          | Borrower’s education level                                 |
| EmploymentType | Categorical          | Employment type (Salaried, Self-employed, etc.)            |
| MaritalStatus  | Categorical          | Marital status of the borrower                             |
| HasMortgage    | Categorical (Yes/No) | Whether the borrower has an existing mortgage              |
| HasDependents  | Categorical (Yes/No) | Whether the borrower has dependents                        |
| LoanPurpose    | Categorical          | Purpose of the loan (Home, Car, Education, Personal, etc.) |
| HasCoSigner    | Categorical (Yes/No) | Whether the loan has a co-signer                           |
| Default        | Binary (0/1)         | Target variable: 1 = Default, 0 = No Default               |
| Loan Date      | Date                 | Date when the loan was issued                              |

## Tools Used
- Python (ydata-profiling, numpy, pandas, matplotlib, seaborn)
- SQL (PostgreSQL)
- Power BI

## Project Workflow

This project follows a structured analytics workflow used in risk analytics and business intelligence projects:
<img width="1024" height="432" alt="image" src="https://github.com/user-attachments/assets/ee8c240a-662f-461d-b2bc-aa9db29fe7cb" />

## Executive Summary

- Portfolio default rate stands at 11.61%, nearly double the industry prime lending benchmark of ~6%, indicating the book contains a significant subprime segment   that has not been adequately risk-priced or filtered at origination.
- Employment type is the strongest behavioral risk signal, Unemployed borrowers represent ~25% of the entire portfolio (≈64K loans), a structurally unsound concentration given that unemployment eliminates income continuity, the most basic condition for loan repayment.
- High rate borrowers (>18% interest) are simultaneously the most stressed and most likely to default interest rates above 18% compound monthly payment burden on top of already high DTI ratios, creating a self reinforcing default spiral where the risk pricing itself becomes a driver of the outcome it was meant to compensate for.

- Credit score and DTI together explain most of the default variation borrowers with Poor credit (<580) and DTI above 50% default at rates approaching 2–3× the portfolio average; this combination is the single most actionable rule for a credit policy cut-off.
- The portfolio lacks risk stratification at origination all four employment types and all five loan purposes appear in nearly equal proportions (~63–64K loans each), suggesting loans were approved without meaningful segment level filtering. A rule-based segmentation framework (Low / Medium / High Risk tiers) applied at underwriting would be expected to reduce the overall default rate by redirecting or repricing the High Risk tier.

## Dashboard Report Pages 
### Page 1 : Executive Overview
<img width="1022" height="681" alt="image" src="https://github.com/user-attachments/assets/7c11795d-a338-4cab-8b78-935598b30391" />

### Page 2 : Risk Analysis 
<img width="1020" height="677" alt="image" src="https://github.com/user-attachments/assets/cca3663c-c24b-4ba2-9025-1122d75f1173" />

### Page 3 : Cohort Analysis
<img width="1019" height="670" alt="image" src="https://github.com/user-attachments/assets/3b5f5d62-bbd7-422d-9657-a7aa2647ba85" />

### Quick Overview 
<img width="1021" height="677" alt="image" src="https://github.com/user-attachments/assets/c27b4661-50e5-4ece-bfb9-5429b2842d5c" />



## Insights Deep Dive
Key insights :
- The portfolio default rate of 11.61% is high for a prime lending book — this suggests either a subprime portfolio or loose underwriting in certain segments.
  Unemployed borrowers receiving loans at all is a red flag — this should be near-zero in a well-underwritten book.
- With equal distribution across employment types (~64K each), the portfolio appears to not be filtering by employment status, which explains the high overall    default rate.
- High-interest-rate borrowers (>18%) carry the highest default rates because rate is both a risk indicator and a driver of payment stress.

## Business Recommendations
| Customer Segment                     | Recommended Action                     | Why                                                      |
|------------------------------------|----------------------------------------|----------------------------------------------------------|
| Low Risk (score ≤ 3)               | Approve, offer best rates              | Low default rate → highly profitable segment              |
| Medium Risk (score 4–6)            | Approve with higher interest rate      | Risk can be priced; still profitable                     |
| High Risk (score ≥ 7)              | Decline or require co-signer           | Default rate exceeds acceptable loss threshold           |
| Unemployed + Poor Credit           | Decline                                | No stable income + weak credit history                   |
| High Income + Exceptional Credit   | Target for marketing                   | Lowest risk, high lifetime value, low acquisition cost   |
| Self-employed + Low DTI            | Approve                                | Income variability offset by strong debt management      |

