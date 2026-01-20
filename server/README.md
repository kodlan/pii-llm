# vLLM Server Setup

This directory contains scripts to run a vLLM server with an OpenAI-compatible API.

## Prerequisites

- Docker with NVIDIA Container Toolkit
- NVIDIA GPU with sufficient VRAM (16GB+ recommended for 7B models)

## Quick Start

1. Copy the environment file and configure:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` to set your model:
   ```bash
   # For open models (no token needed)
   MODEL_NAME=mistralai/Mistral-7B-Instruct-v0.3

   # For gated models (token required)
   MODEL_NAME=meta-llama/Llama-3.1-8B-Instruct
   HF_TOKEN=hf_your_token_here
   ```

3. Start the server:
   ```bash
   ./start.sh
   ```

4. Check logs:
   ```bash
   docker compose logs -f
   ```

5. Stop the server:
   ```bash
   ./stop.sh
   ```

## API Usage

The server exposes an OpenAI-compatible API at `http://localhost:8000/v1`.

Test with curl:
```bash
curl http://localhost:8000/v1/models
```

From your client machine, configure:
```bash
LLM_BASE_URL=http://<server-ip>:8000/v1
LLM_API_KEY=dummy
```

## Recommended Models for PII Detection

| Model | VRAM | Token Required |
|-------|------|----------------|
| `mistralai/Mistral-7B-Instruct-v0.3` | ~16GB | No |
| `Qwen/Qwen2.5-7B-Instruct` | ~16GB | No |
| `meta-llama/Llama-3.1-8B-Instruct` | ~18GB | Yes |

## Troubleshooting

**Model download slow**: Set `HF_TOKEN` even for non-gated models for faster downloads.

**Out of memory**: Try a smaller model or add `--max-model-len 4096` to the command in docker-compose.yml.

**Check GPU**: Run `nvidia-smi` to verify GPU is detected.
