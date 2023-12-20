# PyTorch

* [How to determine the largest batch size of a given model saturating the GPU?](https://discuss.pytorch.org/t/how-to-determine-the-largest-batch-size-of-a-given-model-saturating-the-gpu/146075)
* [How 🤗 Accelerate runs very large models thanks to PyTorch ](https://huggingface.co/blog/accelerate-large-models)
* [Assisted Generation: a new direction toward low-latency text generation](https://huggingface.co/blog/assisted-generation)
* [Accelerating Generative AI with PyTorch II: GPT, Fast](https://pytorch.org/blog/accelerating-generative-ai-2/)

## Installation

Previous versions: <https://pytorch.org/get-started/previous-versions/>

Poetry:

```toml
[tool.poetry.dependencies]
torch = [
    { version = "==2.1.0", source = "pytorch", platform = "!=darwin" },
    { version = "==2.1.0", source = "pypi", platform = "darwin" }
]
torchaudio = [
    { version = "==2.1.0", source = "pytorch", platform = "!=darwin" },
    { version = "==2.1.0", source = "pypi", platform = "darwin" }
]
torchvision = [
    { version = "==0.16.0", source = "pytorch", platform = "!=darwin" },
    { version = "==0.16.0", source = "pypi", platform = "darwin" }
]

[[tool.poetry.source]]
name = "pytorch"
url = "https://download.pytorch.org/whl/cu121"
priority = "explicit"
```

## Reclaim GPU memory

# Have to delete the Python object and then garbage-collect to allow CUDA memory to be freed
# https://stackoverflow.com/a/70541483/125246

```python
del model
gc.collect()
torch.cuda.empty_cache()
```