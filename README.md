# Bidirectional Neural Machine Translation Between Standard Bangla and the Chatgaya Dialect

### Using Fine-Tuned mBART-50 for Low-Resource Dialect Translation

<p align="center">
  <strong>A complete research project on Standard Bangla ↔ Chatgaya Neural Machine Translation</strong>
</p>

<p align="center">
  Dataset • Data Augmentation • mBART-50 • FastAPI • Flutter • Evaluation
</p>

---

## 📌 Overview

This repository contains the complete research materials and implementation of my undergraduate thesis:

> **Bidirectional Neural Machine Translation Between Standard Bangla and the Chatgaya Dialect Using Fine-Tuned mBART-50**

The research focuses on developing a **bidirectional Neural Machine Translation (NMT) system** between Standard Bangla and the Chatgaya dialect, a low-resource regional variety of Bangla.

The project covers the complete research workflow, starting from **manual parallel corpus construction and lexical resource development** to **data augmentation, mBART-50 fine-tuning, evaluation, backend deployment, and mobile application development**.

This repository contains:

- 📊 Manually curated parallel corpus
- 📖 Chatgaya lexical variation resource
- 🔄 Data augmentation scripts
- 🤖 mBART-50 fine-tuning and evaluation code
- 🖥️ FastAPI translation server
- 📱 Flutter mobile application
- 📄 Complete thesis report
- 📊 Presentation slides
- 🖼️ Research poster
- 📚 Supporting documentation

> **Note:** The trained model checkpoints are not included in this repository because of their large file size. They are intentionally excluded using `.gitignore`.

---

# 🎯 Research Objective

The main objective of this research is to investigate whether a pretrained multilingual Transformer model such as **mBART-50** can be effectively adapted for low-resource translation between Standard Bangla and Chatgaya.

The research specifically focuses on:

1. Constructing a manually curated Standard Bangla–Chatgaya parallel corpus.
2. Developing a lexical variation resource for Chatgaya.
3. Investigating lexicon-based data augmentation.
4. Fine-tuning mBART-50 for both translation directions.
5. Comparing original and augmented training datasets.
6. Evaluating translation quality using BLEU and chrF.
7. Conducting human evaluation with native Chatgaya speakers.
8. Deploying the trained models through a practical mobile translation system.

---

# 🔬 Research Workflow

```text
Research Planning
       │
       ▼
Manual Parallel Corpus Construction
       │
       ▼
Chatgaya Lexicon Development
       │
       ▼
Native Speaker Survey & Validation
       │
       ▼
Dataset Verification & Refinement
       │
       ▼
Lexicon-Based Data Augmentation
       │
       ▼
Train / Validation / Test Split
       │
       ▼
mBART-50 Fine-Tuning
       │
       ├─────────────────────┐
       │                     │
       ▼                     ▼
Bangla → Chatgaya      Chatgaya → Bangla
       │                     │
       └──────────┬──────────┘
                  ▼
          Automatic Evaluation
             BLEU + chrF
                  │
                  ▼
            Human Evaluation
                  │
                  ▼
            Best Model Selection
                  │
                  ▼
            FastAPI Backend
                  │
                  ▼
          Flutter Mobile App
```

---

# 📊 Dataset

A manually curated parallel corpus was developed specifically for this research.

### Parallel Corpus

| Property | Details |
|---|---|
| Language Pair | Standard Bangla ↔ Chatgaya |
| Total Sentence Pairs | **2,020** |
| Dataset Type | Manually Curated Parallel Corpus |
| Translation Directions | Bangla → Chatgaya & Chatgaya → Bangla |
| Data Validation | Native Speaker Validation |

The corpus was manually constructed to provide suitable parallel data for training and evaluating low-resource neural machine translation models.

---

# 📖 Chatgaya Lexicon

A separate lexical variation resource was developed to capture regional vocabulary and alternative Chatgaya expressions.

The lexicon contains **49 lexical entries** and preserves multiple Chatgaya variations for corresponding Standard Bangla expressions.

### Example

| Meaning | Bangla | Chatgaya |
|---|---|---|
| good | ভালো | ভালা \| গম |
| in_the_morning | সকালে | বেইন্নে \| ফজোরত |
| all | সবাই | বিয়াজ্ঞুন \| বেজ্ঞুন |
| coming | আসছি | আইর \| আইয়্যির |
| tomorrow | আগামীকাল | হালিয়ে \| হালিইয়্যে |

The lexicon was developed as an independent linguistic resource and was used to support **lexicon-based data augmentation**.

---

# 🔄 Data Augmentation

Because Chatgaya is a low-resource dialect, the available training data is limited in both size and lexical diversity.

To address this issue, a **lexicon-based data augmentation strategy** was developed.

The augmentation process identifies Chatgaya lexical items that have multiple dialectal variations and replaces canonical expressions with alternative variations to generate additional training samples.

### Example

Canonical sentence:

```text
Standard Bangla:
আজকে সকালে

Chatgaya:
আজিয়ে বেইন্নে
```

Suppose the lexicon contains:

```text
আজকে → আজিয়ে | আজিইয়্যে
সকালে → বেইন্নে | ফজোরত
```

The augmentation process can generate:

```text
আজিয়ে বেইন্নে
আজিয়ে ফজোরত
আজিইয়্যে বেইন্নে
আজিইয়্যে ফজোরত
```

This increases lexical diversity while maintaining the original sentence meaning.

### Training Dataset Expansion

```text
Original Training Set
1,616 sentence pairs
        │
        ▼
Lexicon-Based Augmentation
        │
        ▼
Augmented Training Set
2,507 sentence pairs
```

The validation and test sets were kept unchanged to ensure fair comparison between the original and augmented models.

---

# 🤖 Model

The research uses **mBART-50**, a multilingual pretrained sequence-to-sequence Transformer model.

The pretrained model was fine-tuned specifically for:

```text
Standard Bangla → Chatgaya
Chatgaya → Standard Bangla
```

Four experimental models were developed by combining:

- Two translation directions
- Original training dataset
- Augmented training dataset

### Experimental Model Design

```text
                    Training Dataset
                           │
              ┌────────────┴────────────┐
              │                         │
          Original                  Augmented
              │                         │
        ┌─────┴─────┐             ┌─────┴─────┐
        │           │             │           │
      BN → CTG    CTG → BN      BN → CTG    CTG → BN
        │           │             │           │
        ▼           ▼             ▼           ▼
       M1          M2            M3          M4
```

---

# ⚙️ Training Configuration

The models were fine-tuned using the Hugging Face training framework.

| Parameter | Value |
|---|---|
| Pretrained Model | `facebook/mbart-large-50` |
| Training Framework | Hugging Face Seq2SeqTrainer |
| Training Environment | Google Colab |
| Number of Epochs | 10 |
| Learning Rate | `5 × 10⁻⁵` |
| Training Batch Size | 4 |
| Validation Batch Size | 4 |
| Gradient Accumulation Steps | 2 |
| Evaluation Strategy | After each epoch |
| Model Saving Strategy | After each epoch |
| Maximum Checkpoints Retained | 2 |
| Best Model Selection | Based on validation loss |
| Random Seed | 42 |
| Mixed Precision | Enabled when CUDA was available |

---

# 📈 Evaluation Methodology

Translation quality was evaluated using both **automatic metrics** and **human evaluation**.

## BLEU

**BLEU (Bilingual Evaluation Understudy)** measures translation quality by comparing the n-gram overlap between generated translations and reference translations.

Higher BLEU scores indicate greater similarity between the generated and reference translations.

---

## chrF

**chrF (Character F-score)** measures character-level similarity between generated and reference translations.

chrF is particularly useful for low-resource and morphologically rich languages because it can capture smaller lexical and morphological variations that may not receive sufficient credit from word-level metrics.

---

## Human Evaluation

Automatic metrics were complemented with evaluation by **native Chatgaya speakers**.

The human evaluation considered aspects such as:

- Translation quality
- Naturalness
- Dialectal appropriateness
- Lexical correctness
- Sentence construction

This provided an additional qualitative perspective beyond automatic evaluation metrics.

---

# 📊 Key Results

For the **Bangla → Chatgaya** translation direction, lexicon-based data augmentation improved both BLEU and chrF scores.

| Dataset | BLEU | chrF |
|---|---:|---:|
| Original | 42.39 | 69.51 |
| Augmented | **45.06** | **72.11** |

### Improvement

```text
BLEU
42.39 ─────────────────► 45.06
             +2.67

chrF
69.51 ─────────────────► 72.11
             +2.60
```

These results indicate that lexicon-based augmentation helped improve lexical diversity and translation quality for Bangla-to-Chatgaya translation.

---

# 🏗️ System Architecture

The trained translation models were integrated into a client-server architecture.

```text
┌──────────────────────────────┐
│      Flutter Mobile App      │
│                              │
│   Bangla ↔ Chatgaya UI       │
└──────────────┬───────────────┘
               │
               │ HTTP Request
               ▼
┌──────────────────────────────┐
│        FastAPI Server        │
│                              │
│       Translation API        │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│       Fine-Tuned mBART-50    │
│                              │
│   BN → CTG / CTG → BN        │
└──────────────────────────────┘
```

---

# 📱 Mobile Application

A Flutter-based mobile application was developed as the user-facing interface.

### Main Features

- Standard Bangla → Chatgaya translation
- Chatgaya → Standard Bangla translation
- Translation direction switching
- Text input and translated output
- Real-time communication with the FastAPI backend

The application demonstrates the practical deployment of the research models in a mobile environment.

---

# 🖥️ FastAPI Backend

The translation service is implemented using **FastAPI**.

The backend performs the following operations:

1. Loads the fine-tuned mBART-50 model.
2. Receives translation requests from the Flutter application.
3. Tokenizes the input sentence.
4. Performs model inference.
5. Decodes the generated sequence.
6. Returns the translated text to the application.

---

# 📁 Repository Structure

```text
.
├── app/
│   └── Flutter Mobile Application
│
├── server/
│   └── FastAPI Translation Server
│
├── data/
│   ├── processed/
│   ├── raw/
│
├── notebooks/
│   ├── preprocessing/
│   ├── dataset analysis/
│   ├── all important notebooks/
│
├── thesis/
│   ├── report/
│   ├── presentation/
│   └── poster/
│
├── notebooks/
│   └── Research and experimentation notebooks
│
├── docs/
│   └── dataset_progress
│
├── .gitignore
└── README.md
```


---

# 🧠 Model Checkpoints

The fine-tuned model checkpoints are **not included in this Git repository** because of their large file size.

They are intentionally excluded through `.gitignore`.

The repository contains the necessary:

- Dataset
- Data preprocessing code
- Data augmentation code
- Training scripts
- Evaluation scripts
- Training configuration
- FastAPI server
- Flutter application

Therefore, the training and deployment workflow can be reproduced by obtaining the required model checkpoints separately or retraining the models using the provided resources.

---

# 🚀 Running the Project

## 1. Dataset and Model Training

The training pipeline follows:

```text
Dataset
   ↓
Preprocessing
   ↓
Lexicon Development
   ↓
Data Augmentation
   ↓
Train / Validation / Test Split
   ↓
mBART-50 Fine-Tuning
   ↓
Evaluation
   ↓
Best Model Checkpoint
```

---

## 2. FastAPI Server

Navigate to the server directory:

```bash
cd server
```

Install the required dependencies:

```bash
pip install -r requirements.txt
```

Place the required fine-tuned model checkpoint in the expected model directory.

Start the FastAPI server:

```bash
uvicorn app:app --host 0.0.0.0 --port 8000
```

---

## 3. Flutter Application

Navigate to the application directory:

```bash
cd app
```

Install Flutter dependencies:

```bash
flutter pub get
```

Configure the API base URL according to your server environment.

Then run the application:

```bash
flutter run
```

---

# 🧪 Reproducibility

This repository preserves the complete research-to-deployment workflow.

The overall process can be followed as:

```text
Manual Dataset
      ↓
Lexicon
      ↓
Preprocessing
      ↓
Data Augmentation
      ↓
Model Training
      ↓
Automatic Evaluation
      ↓
Human Evaluation
      ↓
Model Selection
      ↓
FastAPI Deployment
      ↓
Flutter Application
```

This structure is intended to make the project useful for future research on low-resource Bangla dialect translation.

---

# 📚 Thesis Materials

The repository includes the major academic and project materials associated with this research:

- 📄 Complete Thesis Report
- 📊 Final Presentation Slides
- 🖼️ Research Poster
- 📊 Dataset
- 📖 Lexicon Resource
- 🔄 Data Augmentation Code
- 🤖 Model Training Code
- 📈 Evaluation Code
- 🖥️ FastAPI Backend
- 📱 Flutter Mobile Application
- 📚 Supporting Documentation

---

# 🌱 Future Enhancement

The current research provides a foundation for further development.

Potential future directions include:

- Expanding the parallel corpus
- Increasing lexical coverage
- Supporting additional Bangla regional dialects
- Exploring larger and more advanced multilingual models
- Improving translation quality with larger datasets
- Integrating speech-to-text
- Integrating text-to-speech
- Developing end-to-end voice translation
- Supporting offline translation
- Deploying the system on scalable cloud infrastructure
- Conducting larger-scale real-world user evaluation

A major future direction is extending the current text-based system into a **voice-enabled Standard Bangla ↔ Chatgaya translation system**.

---

# 🏆 Major Contributions

The major contributions of this research include:

- A manually curated **2,020-pair Standard Bangla–Chatgaya parallel corpus**
- A **49-entry Chatgaya lexical variation resource**
- A lexicon-based data augmentation approach for low-resource translation
- Four fine-tuned mBART-50 translation models
- Automatic evaluation using BLEU and chrF
- Native-speaker human evaluation
- A FastAPI-based translation backend
- A Flutter-based mobile translation application
- A complete research-to-deployment workflow for a low-resource Bangla dialect

---

# 👨‍💻 Author

## Mostafa Al Moin

**Undergraduate Student**  
Department of Computer Science and Engineering  
**BGC Trust University Bangladesh**

### Research Interests

- Natural Language Processing
- Neural Machine Translation
- Low-Resource Languages
- Multilingual Transformers
- Machine Learning
- Artificial Intelligence
- Flutter
- FastAPI

---

# 🙏 Acknowledgement

I would like to express my sincere gratitude to my thesis supervisor **Md. Asaduzzaman** for his continuous guidance, valuable feedback, and support throughout this research.

I am also grateful to the teachers, friends, classmates, and native Chatgaya speakers who contributed to the development, validation, and completion of this research.

Finally, I thank everyone who supported me throughout this journey.

---

<p align="center">
  <strong>Preserving Regional Language Through Technology 🤍</strong>
</p>

<p align="center">
  Standard Bangla ↔ Chatgaya
</p>
