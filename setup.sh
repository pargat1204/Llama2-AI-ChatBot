%cd /content
!apt-get -y install -qq aria2

!git clone -b v1.8 https://github.com/camenduru/text-generation-webui
%cd /content/text-generation-webui
!pip install -r requirements.txt

!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/resolve/main/model-00001-of-00003.safetensors -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o model-00001-of-00003.safetensors
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/resolve/main/model-00002-of-00003.safetensors -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o model-00002-of-00003.safetensors
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/resolve/main/model-00003-of-00003.safetensors -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o model-00003-of-00003.safetensors
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/raw/main/model.safetensors.index.json -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o model.safetensors.index.json
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/raw/main/special_tokens_map.json -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o special_tokens_map.json
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/resolve/main/tokenizer.model -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o tokenizer.model
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/raw/main/tokenizer_config.json -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o tokenizer_config.json
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/raw/main/config.json -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o config.json
!aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/4bit/Llama-2-13b-chat-hf/raw/main/generation_config.json -d /content/text-generation-webui/models/Llama-2-13b-chat-hf -o generation_config.json

%cd /content/text-generation-webui
!python server.py --share --chat --load-in-8bit --model /content/text-generation-webui/models/Llama-2-13b-chat-hf
