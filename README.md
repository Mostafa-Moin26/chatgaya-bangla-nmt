# 🌍 Chatgaya ↔ Standard Bangla Neural Machine Translation

**Author:** Mostafa Al Moin  
**Degree:** B.Sc. in Computer Science & Engineering  
**Project Type:** Undergraduate Thesis  
**Topic:** Bidirectional Neural Machine Translation between Chatgaya Dialect and Standard Bangla using mBART-50  

---

## 📌 Project Overview

This project builds a **bidirectional translation system** between:

- **Chatgaya** (Chittagonian dialect)  
- **Standard Bangla**

using a **pretrained multilingual Transformer model (mBART-50)** fine-tuned on a **manually curated dialect dataset**.

Because Chatgaya is a **low-resource, non-standardized dialect**, the project focuses heavily on:

- High-quality **manual data collection**
- **Dialectal variation handling**
- **Controlled data augmentation**
- **Fair and realistic evaluation**

## 🎯 Objectives

1. Create a **2,000-pair manually verified Chatgaya–Bangla parallel corpus**
2. Capture **spelling and lexical variation** without duplicating sentences
3. Fine-tune **mBART-50** for:
   - **Chatgaya → Bangla**
   - **Bangla → Chatgaya**
4. Evaluate using:
   - **BLEU**
   - **chrF**
   - **Human judgment**
5. Deliver a **research-grade low-resource translation system**

## 🧱 Three-Layer Dataset Design

To handle Chatgaya’s spelling and regional variation, the dataset is organized into three layers.

### **Layer 1 — Canonical Dataset**

This is the main parallel corpus used for training and evaluation.

bangla, chatgaya<br>

আজ আমি ভাত খাবো না, আজিয়্যে আঁই ভাত ন হাইয়্যুম<br>

তুমি কেমন আছো, তুঁই কেন আছো?


**Rules:**

- One Bangla sentence → one Chatgaya sentence  
- Natural spoken Chatgaya  
- No duplicate Bangla sentences  

**Used for:**

- Training  
- Validation  
- Testing  

### **Layer 2 — Variation Lexicon**

This stores alternative spellings and dialect forms collected from Google Forms.

meaning, bangla, chatgaya_variants <br>
today, আজ, আজিয়ে | আজিয়্যে <br>
morning, সকাল, বেইন্নে | ফজোরত <br>
good, ভালো, ভালা | গম



**This file:**

- Is NOT used directly for training
- Is used to create controlled variants


### **Layer 3 — Augmented Training Data**

This stores alternative spellings and dialect forms collected from Google Forms.


Example: 


Canonical:

আজিয়ে বেইন্নে আঁই ভাত ন হাইয়্যুম

Augmented:

আজিয়ে ফজরত আঁই ভাত ন হাইয়্যুম

**Used only in:**

- Training set


**Never used in:**

- Validation
- Test


## 📁 Project Structure

```
Chatgaya-Bangla-NMT/
│
├── data/
│   ├── canonical.csv         # Layer-1 clean dataset
│   ├── lexicon.csv           # Layer-2 variation lexicon
│   ├── augmented_train.csv  # Layer-3 generated variants
│   ├── train.csv
│   ├── val.csv
│   └── test.csv
│
├── notebooks/
│   ├── dataset_cleaning.ipynb
│   ├── lexicon_builder.ipynb
│   ├── augmentation.ipynb
│   ├── mbart_training.ipynb
│   └── evaluation.ipynb
│
├── src/
│   ├── prepare_data.py
│   ├── augment.py
│   ├── train.py
│   └── evaluate.py
│
├── results/
│   ├── models/
│   ├── logs/
│   └── scores/
│
├── requirements.txt
└── README.md
```

## ⚙️ Model

**Base model:**

```text
facebook/mbart-large-50-many-to-many-mmt
```
**Fine-tuning:**

- Sequence-to-sequence learning  
- Chatgaya ↔ Bangla (both directions)  
- Low-resource training  
- Teacher forcing  
- Early stopping  

---

## 📈 Evaluation

### Automatic Metrics
- BLEU
- chrF

### Human Evaluation
100 random sentences rated by native Chatgaya speakers:
- Correct
- Partially correct
- Incorrect

---

## 🧪 Data Collection

- Standard Bangla sentences provided via **Google Forms**
- Respondents write **natural Chatgaya**
- Multiple responses collected
- Researcher (native Chatgaya speaker) selects:
  - One canonical version
  - Extracts variant words for lexicon

No private or sensitive data is used.

---

## 🗓 Project Timeline

| Phase | Work |
|------|------|
Data collection | Google Forms, 2k sentences |
Cleaning & lexicon | Variant extraction |
Augmentation | Lexicon-based variants |
Training | mBART-50 fine-tuning |
Evaluation | BLEU + human |
Thesis | Writing & defense |

---

## ⚖️ Ethics

- No private data
- Dialect preserved without forcing standard spelling
- Used only for academic research

---

## 🧑‍💻 Author

**Mostafa Al Moin**  
BSc in CSE  
Chatgaya–Bangla NMT Thesis  
Bangladesh  
