# Loan-Default-Risk-Analysis
This project includes SQL data validation, EDA, statistical analysis and Power BI dashboard to identify high risk customers and support data driven lending decisions.

## Table of Contents
- [Background Overview](#background-overview)
- [Problem Statement](#problem-statement)
- [Data Structure Overview](#data-structure--overview)
- [Tools Used](#tools-used)
- [Project Workflow](#project-workflow)
- [Executive Summary](#executive-summary)
- [Insights Deep Dive](#insights-deep--dive)
- [Risk Segmentation Strategy](#risk-segmentation--strategy)
- [Business Recommendations](#business-recommendations)
- [Dashboard Explanation](#dashboard-explanation)

## Dataset Link : [https://drive.google.com/file/d/1RYntjTaRINDeZrUPD77lCymrXTNu9FXR/view?usp=drive_link]

## Background Overview : 
The financial services industry provides loans to customers, but a portion of borrowers fail to repay, resulting in loan defaults and financial losses. This project analyzes borrower financial and behavioral data to identify high risk customer segments and help financial institutions make better credit approval and risk management decisions.

# Problem Statement : 
## Business objective: 
Banks needs to minimize credit losses while maintaining loan portfolio growth. When borrowers default, bank loses principal and incurs collection costs. The business wants to identify which customer profiles carry high default risk before approving loans.
## Analytical objective: 
Segment the 255K loan portfolio by risk profile using observable characteristics (income, credit score, DTI, employment type) and quantify default rates at each risk level, to produce decision rules for credit approvals, pricing, and marketing targeting.

# Data Structure Overview : 
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

# Tools Used : 
- Python (ydata-profiling, numpy, pandas, matplotlib, seaborn)
- SQL (PostgreSQL)
- Power BI

# Project Workflow :

This project follows a structured analytics workflow used in risk analytics and business intelligence projects:
<img width="1024" height="432" alt="image" src="https://github.com/user-attachments/assets/ee8c240a-662f-461d-b2bc-aa9db29fe7cb" />

# Executive Summary : 




