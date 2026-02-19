CREATE TABLE case_analysis (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    case_id UUID UNIQUE ,

    status VARCHAR(50) NOT NULL,  -- success / failed

    risk_score INT NOT NULL,
    classification VARCHAR(50),   -- Low / Medium / High

    threshold INT NOT NULL,

    evidence_generated BOOLEAN DEFAULT FALSE,

    analyzed_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_case_analysis_risk_score ON case_analysis(risk_score);
CREATE INDEX idx_case_analysis_classification ON case_analysis(classification);



CREATE TABLE risk_breakdown (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    analysis_id UUID REFERENCES case_analysis(id) ON DELETE CASCADE,

    customer_risk INT,
    alert_risk INT,
    geographic_risk INT,
    pattern_risk INT,
    transaction_risk INT
);




CREATE TABLE evidence (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    analysis_id UUID REFERENCES case_analysis(id) ON DELETE CASCADE,

    evidence_type VARCHAR(100),
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);