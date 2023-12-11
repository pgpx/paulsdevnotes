# LLM Models

* <https://huggingface.co/>
* Falcon
  * [tiiuae/falcon-180B-chat](https://huggingface.co/tiiuae/falcon-180B-chat)
    * <https://huggingface.co/blog/falcon>
    * [Falcon 180B foundation model from TII is now available via Amazon SageMaker JumpStart](https://aws.amazon.com/blogs/machine-learning/falcon-180b-foundation-model-from-tii-is-now-available-via-amazon-sagemaker-jumpstart/) - needs `ml.p4de.24xlarge` instances - 8-bit quantized can run on `ml.p4d.24xlarge` but inference is 5x slower.
  * [TheBloke/Falcon-180B-Chat-GPTQ](https://huggingface.co/TheBloke/Falcon-180B-Chat-GPTQ)
* [LeoLM/leo-hessianai-13b-chat](https://huggingface.co/LeoLM/leo-hessianai-13b-chat) - German Foundation Language Model built on Llama-2
* [NLLB - No Language Left Behind]() - Open-source models capable of delivering evaluated, high-quality translations directly between 200 languages.  <https://ai.meta.com/research/no-language-left-behind/>
  * Paper: [No Language Left Behind: Scaling Human-Centered Machine Translation](https://arxiv.org/abs/2207.04672)
* OpenAI [Introducing GPTs](https://openai.com/blog/introducing-gpts)
* * [Orca 2](https://www.microsoft.com/en-us/research/blog/orca-2-teaching-small-language-models-how-to-reason/): Teaching Small Language Models How to Reason

## Tools

* [lit-gpt](https://github.com/Lightning-AI/lit-gpt) - supports running many models, including using quantization.