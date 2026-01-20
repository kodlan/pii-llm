#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ ! -f .env ]; then
    echo "Error: .env file not found"
    echo "Run: cp .env.example .env"
    echo "Then edit .env to configure your model"
    exit 1
fi

echo "Starting vLLM server..."
docker compose up -d

echo ""
echo "Server starting. Check logs with: docker compose logs -f"
echo "API will be available at: http://localhost:8000/v1"