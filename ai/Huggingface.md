# Huggingface

## Huggingface Hub

* [Docs](https://huggingface.co/docs/hub/index)

### SDK

* [Cache](https://huggingface.co/docs/huggingface_hub/guides/manage-cache)
* [Text Generation Inference (TGI)](https://huggingface.co/docs/text-generation-inference/index)  is a toolkit for deploying and serving Large Language Models (LLMs)
* GitHub: [notebooks](https://github.com/huggingface/notebooks) - otebooks using the Hugging Face libraries 🤗

### Python Library

* [GitHub](https://github.com/huggingface/huggingface_hub)
* [Docs](https://huggingface.co/docs/huggingface_hub/index)

## Tutorials

* [Generation with LLMs](https://huggingface.co/docs/transformers/llm_tutorial)
* [Handling big models for inference](https://huggingface.co/docs/accelerate/v0.22.0/en/concept_guides/big_model_inference)
* [Efficient Training on Multiple GPUs](https://huggingface.co/docs/transformers/perf_train_gpu_many)
* [Model Parallelism](https://huggingface.co/docs/transformers/v4.15.0/parallelism#zero-data-parallel)
* [Optimizing your LLM in production](https://huggingface.co/blog/optimize-llm)
  * quantization/lower-precision
  * Flash Attention
  * Strategic Selection for Long Text Inputs and Chat

# Copying images

* [hf-transfer](https://github.com/huggingface/hf_transfer) can speed up downloads

```bash
pip install -U "huggingface_hub[cli]"
time huggingface-cli download --cache-dir cache1 --local-dir dir1 --local-dir-use-symlinks=False --force-download  meta-llama/Llama-2-7b-chat-hf --token <token>
# https://github.com/peak/s5cmd
conda config --add channels conda-forge
conda config --set channel_priority strict
conda install s5cmd
time s5cmd sync 'dir1/' s3://hf-models-copy/dir1b/
```

