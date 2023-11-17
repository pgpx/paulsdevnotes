# Models

## Glossary

* [DPR](https://huggingface.co/docs/transformers/model_doc/dpr) - Dense Passage Retrieval - set of tools and models for state-of-the-art open-domain Q&A research. DPR consists in three models:
  1. Question encoder: encode questions as vectors
  2. Context encoder: encode contexts as vectors
  3. Reader: extract the answer of the questions inside retrieved contexts, along with a relevance score (high if the inferred span actually answers the question).
* NLLB - No Language Left Behind - Open-source models capable of delivering evaluated, high-quality translations directly between 200 languages.  <https://ai.meta.com/research/no-language-left-behind/>
* RAG - Retrieval Augmented Generation ([NVIDIA](https://blogs.nvidia.com/blog/what-is-retrieval-augmented-generation/), [IBM](https://research.ibm.com/blog/retrieval-augmented-generation-RAG), [PromptingGuide](https://www.promptingguide.ai/techniques/rag))