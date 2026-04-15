# Biotasys AI - Clinical Microbiota Analysis Engine 🧬🤖

[![Python 3.12+](https://img.shields.io/badge/python-3.12+-blue.svg)](https://www.python.org/downloads/)
[![FastAPI](https://img.shields.io/badge/fastapi-0.104+-green.svg)](https://fastapi.tiangolo.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Biotasys AI Engine** is an advanced clinical processing core designed for extraction and technical interpretation of microbiota laboratory reports. It leverages a **Dual AI Engine** architecture built on Google Gemini to transform unstructured data (PDFs, images, raw JSON) into precise bioinformatic reports with clinical insights.

## 📋 Table of Contents

- [Project Description](#project-description)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Environment Configuration](#environment-configuration)
- [Usage & Execution](#usage--execution)
- [Main API Endpoints](#main-api-endpoints)
- [Contributing](#contributing)
- [License](#license)

---

## Project Description

Biotasys AI is a B2B microservice specializing in multimodal AI-powered extraction and normalization of intestinal microbiota data. The system processes clinical laboratory reports (PDFs, images) and raw microbiota datasets to generate detailed bioinformatic analysis with actionable clinical insights.

### Key Features

- **🤖 Dual AI Engine Architecture**: 
  - **Extraction Engine** (Gemini 2.5 Flash Lite): Fast, optimized retrieval of structured taxonomic data
  - **Interpretation Engine** (Gemini 3 Pro): Deep clinical reasoning and expert analysis

- **📊 Comprehensive Data Processing**:
  - Taxonomic abundance composition (Phyla, Genera, Species)
  - Ecological diversity metrics (Shannon, Simpson, OTU counts)
  - Functional profiling (PICRUSt pathways)
  - Opportunistic pathogen detection
  - Sequencing metadata extraction

- **🔒 Enterprise-Grade Security**:
  - API Key authentication (X-API-KEY header)
  - Role-level access control via Supabase RLS
  - JWT token support for authenticated operations

- **📈 Clinical Intelligence**:
  - Dysbiosis detection and severity classification
  - Taxonomic balance analysis (Firmicutes/Bacteroidetes ratio)
  - Metabolic pathway analysis
  - Opportunistic risk assessment with severity levels

- **✅ Rigorous Data Validation**:
  - Pydantic V2 strict typing for all clinical schemas
  - Comprehensive test coverage (Unit, Integration, API, Resilience)
  - Custom exception hierarchy for clear error diagnostics

---

## Tech Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| **Backend Framework** | FastAPI | ≥0.104.1 |
| **Runtime** | Python | ≥3.12 |
| **Async Server** | Uvicorn | ≥0.24.0 |
| **Data Validation** | Pydantic | ≥2.5.0 |
| **AI Integration** | google-genai | ≥1.63.0 |
| **Database** | Supabase (PostgreSQL) | Latest |
| **PDF Generation** | xhtml2pdf | 0.2.17 |
| **Authentication** | PassLib + Bcrypt | ≥1.7.4 |
| **Code Quality** | Ruff | ≥0.15.1 |
| **Testing Framework** | Pytest | ≥7.0.0 |
| **Configuration** | python-dotenv | ≥1.0.0 |

### Development Dependencies

- Black (code formatting)
- isort (import sorting)
- mypy (static type checking)
- pytest-asyncio (async test support)
- pytest-cov (coverage reporting)
- pre-commit (git hooks)
- polyfactory (test data generation)

---

## Project Structure

```
biotasys-ai/
├── app/
│   ├── api/v1/                 # API Routes & Routers
│   │   ├── clinical.py         # Clinical data processing endpoints
│   │   └── health.py           # Health check & system status
│   │
│   ├── core/                   # Core Application Logic
│   │   ├── exceptions.py       # Custom exception hierarchy
│   │   ├── logging.py          # Structured logging configuration
│   │   ├── security.py         # API key validation & auth
│   │   └── supabase.py         # Supabase client initialization
│   │
│   ├── config/
│   │   └── settings.py         # Pydantic settings (env-based config)
│   │
│   ├── models/
│   │   └── schemas.py          # Pydantic models for validation
│   │
│   ├── repositories/           # Data Access Layer
│   │   ├── base.py            # Abstract repository
│   │   └── report_repository.py # Clinical report persistence
│   │
│   ├── services/               # Business Logic & AI Orchestration
│   │   ├── ai_service.py      # Google Gemini integration (Dual Engine)
│   │   ├── report_service.py  # Report processing pipeline
│   │   ├── pdf_service.py     # PDF generation (Jinja2 + xhtml2pdf)
│   │   └── microbiota_normalizer.py # Data normalization utilities
│   │
│   └── templates/
│       └── pdf/
│           └── microbiota_report.html # Clinical report HTML template
│
├── tests/
│   ├── conftest.py            # Pytest fixtures & configuration
│   ├── factories.py           # Test data factories (polyfactory)
│   │
│   ├── unit/                  # Unit tests (mocked dependencies)
│   │   ├── test_ai_service_unit.py
│   │   ├── test_report_service.py
│   │   ├── test_report_repository.py
│   │   ├── test_ai_rigor.py
│   │   └── test_validators.py
│   │
│   ├── integration/           # Integration tests (full pipeline)
│   │   ├── test_clinical_pipeline.py
│   │   └── test_resilience.py
│   │
│   └── api/                   # API endpoint tests (HTTP)
│       ├── test_clinical_api.py
│       ├── test_clinical_api_json.py
│       ├── test_health.py
│       └── test_security_rigor.py
│
├── scripts/                   # Utility scripts
│   ├── create_tables.py       # Database initialization
│   ├── seed_reports.py        # Test data seeding
│   ├── list_available_models.py # List Gemini models
│   └── setup_storage.sql      # SQL initialization
│
├── sandbox_ui/                # Experimental UI Layer
│   ├── index.html
│   ├── app.js
│   └── style.css
│
├── main.py                    # Application entry point
├── pyproject.toml             # Project metadata & dependencies
├── docker-compose.yml         # Docker services orchestration
├── Dockerfile                 # Container image definition
├── ENV_DOCS.md               # Docker setup guide
├── ENGINE_DOCS.md            # Technical integration manual
├── env.example               # Environment variables template
└── README.md                 # This file

```

### Architecture Pattern: Clean Architecture

```
Presentation Layer (FastAPI Routers)
        ↓
Business Logic Layer (Services)
        ↓
Data Access Layer (Repositories)
        ↓
External Services (AI, Database)
```

---

## Installation

### Prerequisites

- **Python 3.12+** (check with `python --version`)
- **pip** or **uv** package manager
- **Git** (for cloning the repository)

### Option 1: Using pip (Traditional)

```bash
# Clone the repository
git clone https://github.com/yourusername/biotasys-ai.git
cd biotasys-ai

# Create virtual environment
python -m venv .venv

# Activate virtual environment
# On Windows:
.venv\Scripts\activate
# On macOS/Linux:
source .venv/bin/activate

# Install dependencies
pip install -e .

# Install development dependencies
pip install -e ".[dev]"
```

### Option 2: Using uv (Fast)

```bash
# Install uv (one-time)
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Clone and navigate
git clone https://github.com/yourusername/biotasys-ai.git
cd biotasys-ai

# Sync dependencies and create environment
uv sync

# Activate environment
.venv\Scripts\activate
```

### Option 3: Using Docker

```bash
# Build and run with Docker Compose
docker-compose up --build

# Service will be accessible at http://localhost:8000
```

---

## Environment Configuration

### 1. Create `.env` File

Copy `env.example` and customize:

```bash
cp env.example .env
```

### 2. Configure Variables

**Required Variables:**

```env
# Application
APP_NAME=Biotasys AI
APP_VERSION=1.0.0
DEBUG=true

# AI Configuration (Google Gemini)
GEMINI_API_KEY=your_gemini_api_key_here
EXTRACTION_MODEL=gemini-2.5-flash-lite
INTERPRETATION_MODEL=gemini-2.5-flash

# Database (Supabase)
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_KEY=your_supabase_anon_key

# Security
JWT_SECRET_KEY=your_super_secret_jwt_key_here
JWT_ALGORITHM=HS256
JWT_EXPIRE_MINUTES=30

# Server
API_HOST=0.0.0.0
API_PORT=8000
LOG_LEVEL=INFO

# CORS
CORS_ORIGINS=["http://localhost:3000", "http://localhost:8000"]
CORS_ALLOW_CREDENTIALS=true
CORS_ALLOW_METHODS=["GET","POST","PUT","DELETE"]
CORS_ALLOW_HEADERS=["*"]
```

### 3. Obtain API Keys

#### Google Gemini API Key
1. Go to [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Create a project and generate an API key
3. Paste into `GEMINI_API_KEY`

#### Supabase Configuration
1. Create account at [supabase.com](https://supabase.com)
2. Create new project
3. Copy `Project URL` → `SUPABASE_URL`
4. Copy `Anon/Public API Key` → `SUPABASE_KEY`

---

## Usage & Execution

### Development Server

```bash
# Start with auto-reload
python main.py

# Or with uvicorn directly
uvicorn main:app --reload --port 8000

# Or with uv
uv run uvicorn main:app --reload
```

The server will start at: **http://localhost:8000**

Access documentation:
- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc
- **OpenAPI Schema**: http://localhost:8000/openapi.json

### Testing

```bash
# Run all tests
pytest

# Run with coverage report
pytest --cov=app tests/

# Run specific test module
pytest tests/unit/test_ai_service_unit.py

# Run with verbose output
pytest -v

# Run only integration tests
pytest tests/integration/

# Run only API tests
pytest tests/api/
```

### Code Quality

```bash
# Format code
ruff format .

# Lint with Ruff
ruff check .

# Type checking
mypy app/

# Run all quality checks
black app/ && isort app/ && ruff check . && mypy app/
```

### Database Management

```bash
# Create tables (if not exists)
python scripts/create_tables.py

# Seed test data
python scripts/seed_reports.py

# Debug database connection
python scripts/debug_db.py

# List available Gemini models
python scripts/list_available_models.py
```

### Docker Deployment

```bash
# Build image
docker build -t biotasys-ai:latest .

# Run container
docker run -p 8000:8000 --env-file .env biotasys-ai:latest

# Or with Docker Compose
docker-compose up
docker-compose down
```

---

## Main API Endpoints

All clinical endpoints require **X-API-KEY header** authentication.

### Health Check

#### GET `/api/v1/health`

Check system and dependency health status.

**Response (200 OK):**
```json
{
  "status": "healthy",
  "timestamp": "2026-04-15T10:30:00Z",
  "version": "1.0.0",
  "message": "All systems operational",
  "database": {
    "connected": true
  },
  "ai_service": {
    "connected": true
  }
}
```

**Response (503 Service Unavailable):**
```json
{
  "status": "degraded",
  "timestamp": "2026-04-15T10:30:00Z",
  "version": "1.0.0",
  "database": {
    "connected": false,
    "error": "Connection failed"
  }
}
```

---

### Clinical - Process Report (PDF/Image)

#### POST `/api/v1/clinical/process-report`

**DEPRECATED** - Process microbiota report from PDF/image URL.

**Headers:**
```
X-API-KEY: your_api_key_here
Content-Type: application/json
```

**Request Body:**
```json
{
  "file_url": "https://storage.example.com/reports/sample.pdf",
  "documento_id": "doc_88273x",
  "empresa_id": "emp_coaxios_01",
  "doctor_id": "doc_perez_99",
  "fecha_envio": "2026-04-15T10:30:00Z"
}
```

**Response (200 OK):**
```json
{
  "engine_status": "success",
  "report_id": "uuid-report-id",
  "documento_id_origen": "doc_88273x",
  "data": {
    "metadata": {
      "report_date": "2026-04-15",
      "laboratory": "Clinical Lab XYZ"
    },
    "sequencing": {
      "technology": "16S rRNA",
      "region": "V3-V4",
      "platform": "Illumina",
      "total_reads": 100000,
      "filtered_reads": 95000
    },
    "diversity": {
      "shannon_index": 4.2,
      "simpson_index": 0.18,
      "observed_otus": 287
    },
    "taxonomy": {
      "phyla": [
        {"name": "Firmicutes", "abundance": 45.2},
        {"name": "Bacteroidetes", "abundance": 38.1}
      ],
      "firmicutes_bacteroidetes_ratio": 1.19,
      "predominant_genera": [
        {"name": "Faecalibacterium", "abundance": 12.5}
      ]
    },
    "interpretation": {
      "summary": "Microbiota shows normal diversity...",
      "diversity_analysis": "Shannon index within healthy range...",
      "taxonomic_balance": [
        {
          "title": "Normal F/B Ratio",
          "severity": "Ok",
          "description": "Firmicutes/Bacteroidetes ratio is within normal range"
        }
      ]
    },
    "engine_version": "1.2.1 (Dual Engine: Flash-Lite + 3-Pro)",
    "processed_at": "2026-04-15T11:30:00Z"
  }
}
```

**Error Responses:**

| Status | Error | Description |
|--------|-------|-------------|
| 401 | Unauthorized | Missing or invalid X-API-KEY |
| 403 | Forbidden | API key not from certified entity |
| 422 | Validation Error | Invalid request body |
| 500 | AIError | Gemini API processing failed |

---

### Clinical - Process Report (JSON)

#### POST `/api/v1/clinical/process-report-json`

Process raw microbiota JSON data (laboratory output).

**Headers:**
```
X-API-KEY: your_api_key_here
Content-Type: application/json
```

**Request Body:**
```json
{
  "raw_json": {
    "sample_id": "sample_001",
    "abundance": {
      "Firmicutes": 45.2,
      "Bacteroidetes": 38.1,
      "Actinobacteria": 12.3
    },
    "diversity": {
      "shannon": 4.2,
      "simpson": 0.18
    }
  }
}
```

**Response (200 OK):**
```json
{
  "id": "uuid-report-id",
  "metadata": { "..." },
  "sequencing": { "..." },
  "diversity": { "..." },
  "taxonomy": { "..." },
  "interpretation": { "..." },
  "engine_version": "1.2.1",
  "processed_at": "2026-04-15T11:30:00Z"
}
```

**Error Responses:** (Same as POST /process-report)

---

### Clinical - Get Report

#### GET `/api/v1/clinical/report/{report_id}`

Retrieve previously processed report.

**Headers:**
```
X-API-KEY: your_api_key_here
```

**URL Parameters:**
- `report_id` (string, required): UUID of the report

**Response (200 OK):**
```json
{
  "id": "report_id",
  "metadata": { "..." },
  "taxonomy": { "..." },
  "interpretation": { "..." },
  "processed_at": "2026-04-15T11:30:00Z"
}
```

**Error Responses:**

| Status | Error | Description |
|--------|-------|-------------|
| 404 | ResourceNotFoundError | Report not found |
| 401 | Unauthorized | Missing API key |

---

### Clinical - Get Report by Study Code

#### GET `/api/v1/clinical/analysis-reports/{study_code}`

Retrieve report using study code instead of UUID.

**Headers:**
```
X-API-KEY: your_api_key_here
```

**URL Parameters:**
- `study_code` (string, required): Study or document identifier

**Response (200 OK):** Same as GET /report/{report_id}

**Error Responses:** (Same as GET /report/{report_id})

---

### Root Endpoint

#### GET `/`

Basic API information and navigation.

**Response (200 OK):**
```json
{
  "message": "Biotasys AI - Processing System",
  "version": "1.0.0",
  "docs": "/docs",
  "health": "/api/v1/health"
}
```

---

## Error Handling

### Exception Hierarchy

The API implements a custom exception hierarchy for clear error diagnostics:

```python
BiotasysException (base)
├── AIError              # AI service failures (extraction/interpretation)
├── DatabaseError        # Database/Supabase failures
├── ResourceNotFoundError # 404 errors
├── ValidationError      # Pydantic validation failures
└── SecurityError        # Authentication/authorization failures
```

### Error Response Format

All errors return this standardized format:

```json
{
  "error": "AIError",
  "detail": "Gemini Extraction Engine failed",
  "timestamp": "2026-04-15T10:30:00Z"
}
```

### Common Scenarios

| Issue | Status | Error Message | Solution |
|-------|--------|---------------|----------|
| Missing API key | 401 | "Missing Certification Key (X-API-KEY header)" | Add X-API-KEY header |
| Invalid API key | 403 | "Not a Certified Biotasys Entity" | Check API key validity |
| File not accessible | 500 | "Failed to retrieve document from storage" | Verify file URL and permissions |
| Gemini quota exceeded | 503 | "Gemini API quota exceeded" | Wait or upgrade API plan |
| Database down | 503 | "Database connection failed" | Check Supabase status |

---

## Security Considerations

### API Authentication

- All clinical endpoints protected with **X-API-KEY** header
- Keys validated against authorized entity list (Supabase table in production)
- Failed attempts logged with masked keys for security

### Data Protection

- **HTTPS only** in production (enforced at reverse proxy)
- **PostgreSQL Row-Level Security (RLS)** enabled in Supabase
- **Sensitive data encryption** for stored reports
- **API keys masked** in all logs

### Development Best Practices

1. **Never commit `.env`** - Use `env.example` template
2. **Rotate secrets regularly** - Especially JWT keys
3. **Use separate API keys** for dev/staging/production
4. **Enable CORS selectively** - Avoid `["*"]` in production
5. **Rate limiting** - Implement in future versions

---

## Development Workflow

### Code Style & Quality Standards

The project enforces strict code quality with:

- **Black** - Automatic code formatting (line length: 88)
- **Ruff** - Fast linting with strict rules
- **isort** - Consistent import ordering
- **mypy** - Static type checking (strict mode)
- **Pytest** - 100% test coverage goal

### Pre-commit Hooks

Setup automatic checks before each commit:

```bash
pre-commit install
```

This will run:
- Black formatter
- Ruff linter
- isort import sorter
- mypy type checker

### Development Mandates

1. **Async-First Architecture** - No blocking I/O in service layer
2. **KISS Principle** - Keep It Simple & Stupid (avoid over-engineering)
3. **Rigorous Testing** - Unit + Integration + API tests required
4. **Schema Validation** - Any model changes require test coverage updates
5. **Type Annotations** - All functions must have type hints

### Git Workflow

```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make changes and run tests
pytest
ruff format . && ruff check .

# Commit with pre-commit hooks
git add .
git commit -m "feat: add feature description"

# Push and create Pull Request
git push origin feature/your-feature-name
```

---

## Contributing

We welcome contributions! Please follow these guidelines:

### Before You Start

1. **Fork** the repository
2. **Create a feature branch**: `git checkout -b feature/amazing-thing`
3. **Ensure tests pass**: `pytest --cov=app`
4. **Check code quality**: `ruff format . && ruff check .`

### Contribution Process

1. **Write tests first** (TDD approach)
2. **Implement feature** to pass tests
3. **Add documentation** for new features
4. **Submit Pull Request** with description

### Pull Request Guidelines

- Clear, descriptive title: `feat:`, `fix:`, `docs:`, `refactor:`
- Detailed description of changes
- Link to related issues
- Evidence of tests passing
- Updated README if needed

### Code Review

- Minimum 1 approval required
- All CI checks must pass
- No merge conflicts
- Follow project conventions

---

## License

This project is licensed under the **MIT License**.

### MIT License Summary

You are free to:
- ✅ Use commercially
- ✅ Modify the code
- ✅ Distribute
- ✅ Use privately

With conditions:
- 📋 Include license and copyright notice

```
MIT License

Copyright (c) 2026 Biotasys AI Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or persons
to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

See [LICENSE](LICENSE) file for full text.

---

## Support & Resources

### Documentation

- **[ENGINE_DOCS.md](ENGINE_DOCS.md)** - Technical integration manual
- **[DOCKER_README.md](DOCKER_README.md)** - Docker deployment guide
- **[API Documentation](http://localhost:8000/docs)** - Swagger UI (when running)

### Quick Links

- **Issues**: [GitHub Issues](https://github.com/yourusername/biotasys-ai/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/biotasys-ai/discussions)
- **Google Gemini API**: [Documentation](https://ai.google.dev/docs)
- **Supabase**: [Documentation](https://supabase.com/docs)

### Getting Help

1. **Check existing documentation** in repo
2. **Search closed issues** for similar problems
3. **Create new issue** with:
   - Python version
   - OS and environment
   - Error message and traceback
   - Steps to reproduce

---

## Roadmap

### Version 1.0 (Current)
- ✅ Dual Engine architecture
- ✅ PDF/image processing
- ✅ JSON data ingestion
- ✅ API authentication
- ✅ Comprehensive testing

### Version 1.1 (Planned)
- 📋 Rate limiting & quotas
- 📋 Report caching
- 📋 Advanced analytics dashboard
- 📋 Batch processing API
- 📋 Webhook notifications

### Version 2.0 (Future)
- 📋 Multi-language support
- 📋 Custom model training
- 📋 Real-time streaming responses
- 📋 Mobile SDK

---

## Acknowledgments

- **Google Gemini** - AI models and API
- **Supabase** - Database and authentication
- **FastAPI** - Modern Python web framework
- **Pydantic** - Data validation
- **Open-source community** - Dependencies and inspiration

---

## Authors & Maintainers

- **Your Name** - Initial development

---

**Last Updated**: April 15, 2026  
**Status**: Active Development  
**Maintainer**: Your Organization

---

*For questions or suggestions, please open an issue on [GitHub Issues](https://github.com/yourusername/biotasys-ai/issues).*

---
**Biotasys AI** - *The future of Microbiota Interpretation.*