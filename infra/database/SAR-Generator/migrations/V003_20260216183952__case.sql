CREATE TABLE cases (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    case_id UUID UNIQUE NOT NULL,
    generated_at TIMESTAMPTZ NOT NULL,
    institution VARCHAR(255) NOT NULL,

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_cases_case_id ON cases(case_id);


CREATE TABLE customer_kyc (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    case_id UUID REFERENCES cases(case_id) ON DELETE CASCADE,

    customer_id VARCHAR(100) NOT NULL,
    full_name VARCHAR(255),
    dob DATE,
    pan VARCHAR(20),
    aadhaar_last4 VARCHAR(4),
    occupation VARCHAR(255),
    declared_annual_income BIGINT,
    risk_category VARCHAR(50),
    address TEXT,
    kyc_last_updated DATE
);

CREATE INDEX idx_customer_risk ON customer_kyc(risk_category);



CREATE TABLE account_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    case_id UUID REFERENCES cases(case_id) ON DELETE CASCADE,

    account_number VARCHAR(50),
    account_type VARCHAR(50),
    opened_date DATE,

    average_monthly_balance BIGINT,
    average_monthly_credit BIGINT,
    average_monthly_debit BIGINT,

    usual_transaction_pattern TEXT
);


CREATE TABLE alerts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    case_id UUID REFERENCES cases(case_id) ON DELETE CASCADE,

    alert_id VARCHAR(100),
    type VARCHAR(255),
    description TEXT,
    trigger_time TIMESTAMPTZ,
    severity VARCHAR(50)
);

CREATE INDEX idx_alert_severity ON alerts(severity);



CREATE TABLE transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    case_id UUID REFERENCES cases(case_id) ON DELETE CASCADE,

    tx_id VARCHAR(50),
    timestamp TIMESTAMPTZ NOT NULL,

    from_account VARCHAR(100),
    to_account VARCHAR(100),

    amount NUMERIC(15,2),
    currency VARCHAR(10),

    channel VARCHAR(50),
    country VARCHAR(100)
);

CREATE INDEX idx_tx_case_id ON transactions(case_id);
CREATE INDEX idx_tx_timestamp ON transactions(timestamp);
CREATE INDEX idx_tx_amount ON transactions(amount);
CREATE INDEX idx_tx_country ON transactions(country);