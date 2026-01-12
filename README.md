# pii-llm

PII (Personally Identifiable Information) redaction using LLM

## Project Structure

```
pii-llm/
├── notebooks/
│   └── pii_data_experiments.ipynb  # Exploratory notebook for testing PII detection with OpenAI
├── requirements.txt                 # Python dependencies
├── .env.example                     # Environment variable template
└── README.md                        # This file
```

### Notebooks

- **pii_data_experiments.ipynb**: Experiment notebook that loads the [ai4privacy/pii-masking-200k](https://huggingface.co/datasets/ai4privacy/pii-masking-200k) dataset, samples random entries, and tests OpenAI's GPT models for PII detection. Includes side-by-side comparison with ground truth annotations.

## Getting Started

### Prerequisites

- Python 3.8+
- OpenAI API key ([get one here](https://platform.openai.com/api-keys))
- Hugging Face token (optional, for faster dataset downloads - [get one here](https://huggingface.co/settings/tokens))

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd pii-llm
   ```
2. Create venv with conda and specific python version
   ```bash
   conda create -n conda-pii python=3.12 -y
   
   conda activate conda-pii
   python -m venv pii
   conda deactivate
   
   source pii/bin/activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Set up your API keys:
   ```bash
   cp .env.example .env
   # Edit .env and add your OpenAI API key (required)
   # Optionally add your Hugging Face token (HF_TOKEN) for faster dataset downloads
   ```

### Running the Experiments

To run the PII detection experiments:

```bash
jupyter notebook notebooks/pii_data_experiments.ipynb
```

The notebook will:
1. Load the PII masking dataset from Hugging Face
2. Sample 5 random (but reproducible) entries
3. Display the original text and ground truth PII annotations
4. Send samples to OpenAI for PII detection
5. Compare OpenAI's results with ground truth annotations
6. Provide summary statistics

## License

See [LICENSE](LICENSE) for details.
