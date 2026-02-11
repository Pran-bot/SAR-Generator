SAR_Generator

1. create postgress database  and name it SAR_Generator


2. go to backend/main_service/main/java/com/SAR_Generator/resources/application.properties
```
spring.application.name=main_service
# PostgreSQL database configuration
# $env:DB_URL="jdbc:postgresql://localhost:5432/SAR_Generator"

spring.datasource.url=${DB_URL}
spring.datasource.username=postgres
spring.datasource.password=1234
spring.datasource.driver-class-name=org.postgresql.Driver

# JPA configurations
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.session.jdbc.initialize-schema=always

```


3. start all service 
```
docker compose -f infra/docker/docker-compose.dev.yml up
```
```
SAR-GENERATOR/
│
├── README.md
├── package.json              # Root scripts (optional - turborepo/nx)
├── .gitignore
├── .env.example
│
├── frontend/                 # React App
│   ├── package.json
│   ├── vite.config.js
│   ├── tsconfig.json
│   │
│   ├── public/
│   └── src/
│       ├── api/              # API clients
│       ├── auth/
│       ├── components/
│       ├── pages/
│       ├── hooks/
│       ├── store/            # Redux/Zustand
│       ├── routes/
│       ├── styles/
│       └── main.tsx
│
├── backend/
│   │
│   ├── api-gateway/          # Entry Point
│   │   ├── Dockerfile
│   │   ├── nginx.conf
│   │   └── main.go / main.js
│   │
│   ├── main-service/         # Case + Orchestration
│   │   ├── app/
│   │   │   ├── controllers/
│   │   │   ├── services/
│   │   │   ├── models/
│   │   │   └── routes/
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   │
│   ├── python-ai/            # ML + Detection
│   │   ├── anomaly/
│   │   ├── rules/
│   │   ├── network/
│   │   ├── pipelines/
│   │   ├── app.py
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   │
│   ├── llm-service/          # LLM Interface
│   │   ├── prompts/
│   │   ├── chains/
│   │   ├── cache/
│   │   ├── main.py
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   │
│   ├── auth-service/         # Auth/RBAC (Optional)
│   │   ├── src/
│   │   ├── Dockerfile
│   │   └── config/
│   │
│   ├── audit-service/        # Logs + Lineage
│   │   ├── logger/
│   │   ├── storage/
│   │   ├── Dockerfile
│   │   └── main.py
│   │
│   ├── ingestion-service/    # ETL / Bank APIs
│   │   ├── connectors/
│   │   ├── workers/
│   │   ├── Dockerfile
│   │   └── main.py
│   │
│   └── shared/               # Shared Libs
│       ├── schemas/          # JSON Schemas
│       ├── proto/            # gRPC (optional)
│       ├── utils/
│       └── constants/
│
├── infra/                    # Infrastructure
│   │
│   ├── docker/
│   │   ├── docker-compose.yml
│   │   └── base-images/
│   │
│   ├── k8s/
│   │   ├── namespaces/
│   │   ├── frontend/
│   │   ├── api-gateway/
│   │   ├── main-service/
│   │   ├── python-ai/
│   │   ├── llm/
│   │   ├── postgres/
│   │   ├── kafka/
│   │   └── redis/
│   │
│   ├── helm/                 # Optional
│   │   └── sar-chart/
│   │
│   └── terraform/            # Optional (Cloud)
│
├── scripts/                  # DevOps tools
│   ├── build-all.sh
│   ├── deploy.sh
│   └── seed-db.py
│
├── docs/                     # Documentation
│   ├── architecture.md
│   ├── api-spec.yaml
│   ├── threat-model.md
│   └── adr/
│
└── tests/                    # Integration Tests
    ├── e2e/
    ├── load/
    └── security/


```