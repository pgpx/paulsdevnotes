# SageMaker Inference

Options:

* [Real-Time inference](https://docs.aws.amazon.com/sagemaker/latest/dg/realtime-endpoints.html)
* [Batch Transform](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html)
* [Asynchronous Inference](https://docs.aws.amazon.com/sagemaker/latest/dg/async-inference.html)
* [Serverless Inference](https://docs.aws.amazon.com/sagemaker/latest/dg/serverless-endpoints.html)

Docs:

* [Large model inference tutorials](https://docs.aws.amazon.com/sagemaker/latest/dg/large-model-inference-tutorials.html)

Articles:

* [An Amazon SageMaker Inference comparison with Hugging Face Transformers](https://www.philschmid.de/sagemaker-inference-comparison)
* [Deploy Llama 2 7B/13B/70B on Amazon SageMaker](https://www.philschmid.de/sagemaker-llama-llm)
* [How to deploy Llama2 on AWS and Huggingface with Python](https://www.rootstrap.com/blog/how-to-deploy-llama2-on-aws-and-huggingface-with-python)
* [Improve throughput performance of Llama 2 models using Amazon SageMaker](https://aws.amazon.com/blogs/machine-learning/improve-throughput-performance-of-llama-2-models-using-amazon-sagemaker/)
* [Deploy large models at high performance using FasterTransformer on Amazon SageMaker](https://aws.amazon.com/blogs/machine-learning/deploy-large-models-at-high-performance-using-fastertransformer-on-amazon-sagemaker/) - LMI containers, s5cmd for fast download, ... [Jupyter Notebook](https://github.com/aws/amazon-sagemaker-examples/blob/main/inference/generativeai/llm-workshop/lab5-flan-t5-xxl/flan-xxl-sagemaker-fastertransformer-s5cmd.ipynb)

Samples:

* [Deploying a Multi-Model and Multi-RAG Powered Chatbot Using AWS CDK on AWS](https://github.com/aws-samples/aws-genai-llm-chatbot)

## Containers

* AWS SageMaker [HuggingFace Text Generation Inference Containers](https://github.com/aws/deep-learning-containers/blob/master/available_images.md#huggingface-text-generation-inference-containers)

## serving.properties

* [Configuration and settings](https://docs.aws.amazon.com/sagemaker/latest/dg/large-model-inference-configuration.html) for different handlers in the `serving.properties` of a model's `.tar.gz`

# Real-Time inference

* [Docs](https://docs.aws.amazon.com/sagemaker/latest/dg/realtime-endpoints.html)

# Batch Transform

* [Docs](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html)
* [SageMaker Autopilot Batch Inferencing](https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-deploy-models-batch.html)

# Asynchronous Inference

* [Docs](https://docs.aws.amazon.com/sagemaker/latest/dg/async-inference.html)

# Serverless Inference

* [Docs](https://docs.aws.amazon.com/sagemaker/latest/dg/serverless-endpoints.html)
