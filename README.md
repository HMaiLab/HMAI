<div align="center">


# HMAI

### The Open Source AI Agent + Crypto Framework & API

</div>

-----

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-supported-chains">Supported Chains</a> •
  <a href="#-performance">Performance</a> •
  <a href="https://docs.hmai.world" target="_blank">Docs</a> •
  <a href="#-contributions" target="_blank">Contributions</a>
</p>

-----

HMAI is a revolutionary framework that combines AI agents with blockchain technology. It enables developers to build powerful cross-chain applications with integrated AI capabilities for automated trading, smart contract interactions, and blockchain operations.

-----

## ⚡ Features

- Multi-chain Support
- AI-powered Trading Agents
- Smart Contract Integration
- Automated Transaction Management 
- Cross-chain Operations
- Real-time Market Analysis
- Advanced Security Protocols
- Customizable Agent Behaviors

## 🌐 Supported Chains

Currently supporting and in development:

- Solana 💫 (Supported)
- Sui 🚀 (In Development) 
- Aptos ⭐ (In Development)

## 📊 Performance

Latest test results on Solana Dev Network:

- Transaction Volume: 1.7B trades executed
- Program Deployments: 1.5K instances
- Transfer Operations: 72.35M completed
- Success Rate: 98.78%

Currently undergoing mainnet testing with framework release imminent.

## 📖 Documentation


# HMAI API Deployment Guide

Simple guide for deploying HMAI API.

## Quick Start

Get code and setup:
```bash
# Clone repo
git clone https://github.com/HMaiLab/HMAI.git
cd HMAI/api

# Setup environment
cp .env.example .env
pip install poetry
poetry install

# Init database
poetry run prisma generate
poetry run prisma db push

# Start service
poetry run uvicorn app.main:app --reload
```

For Docker deployment:
```bash
# Build and run with Docker
docker build -t hmai-api .
docker run -d -p 8000:8000 --env-file .env --name hmai-api hmai-api
```

Required environment variables in .env:
```
DATABASE_URL="postgresql://..."
SUPABASE_URL="..."
SUPABASE_KEY="..."
OPENAI_API_KEY="..."
```

Project structure:
```
api/
├── app/        # Main code
├── prisma/     # Database
├── supabase/   # Supabase config
└── tests/      # Test files
```

Development commands:
```bash
# Format code
./lint-and-format.sh
# or
make lint

# Run tests  
poetry run pytest
# or
make test

# Database migrations
poetry run prisma migrate dev
poetry run prisma migrate deploy
```

Service endpoints:
- API docs: http://localhost:8000/docs
- Health check: http://localhost:8000/health
- Metrics: http://localhost:8000/metrics

Monitoring:
- Log files in /var/log/hmai/
- Health status at /health endpoint
- Metrics dashboard at /metrics endpoint

For support: support@hmai.world


## 🤝 Contributions

HMAI is an open-source project welcoming community contributions. Whether you're interested in:

- Adding new chain integrations
- Improving AI agent capabilities
- Enhancing documentation
- Bug fixes and optimizations

Your contributions are valuable to making HMAI better.
