import os
from dotenv import load_dotenv
import json
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_core.prompts import ChatPromptTemplate
load_dotenv()

# -------------------------------------------------------
# Gemini LLM Setup
# -------------------------------------------------------

GOOGLE_API_KEY = os.getenv("GOOGLE_API_KEY")
print("API KEY LOADED:", bool(os.getenv("GOOGLE_API_KEY")))
llm = ChatGoogleGenerativeAI(
    model="gemini-2.5-flash",
    temperature=0,  # deterministic
)

# -------------------------------------------------------
# Strict SAR Prompt
# -------------------------------------------------------

SAR_PROMPT = """
You are a financial compliance SAR writer.

You MUST generate a Suspicious Activity Report in STRICT JSON format.

Rules:
- Use only provided facts
- No speculation
- No emotional language
- No assumptions
- Regulatory tone
- Chronological narrative
- Evidence-backed statements only
- Output MUST be valid JSON
- Do NOT include markdown
- Do NOT include explanation

Return format:

{{
  "sar_summary": "",
  "subject_profile": {{}},
  "risk_assessment": {{}},
  "suspicious_indicators": [],
  "transaction_analysis": "",
  "narrative": "",
  "recommended_action": ""
}}

Input Case Data:
{case_data}

Evidence:
{evidence}
"""


prompt_template = ChatPromptTemplate.from_template(SAR_PROMPT)

# -------------------------------------------------------
# SAR Generator
# -------------------------------------------------------

def generate_sar(case_data: dict, evidence: list):

    chain = prompt_template | llm

    response = chain.invoke({
        "case_data": json.dumps(case_data, indent=2),
        "evidence": json.dumps(evidence, indent=2)
    })

    # Gemini returns text → parse JSON safely
    try:
        sar_json = json.loads(response.content)
    except Exception:
        sar_json = {
            "error": "AI output parsing failed",
            "raw_output": response.content
        }

    return sar_json
