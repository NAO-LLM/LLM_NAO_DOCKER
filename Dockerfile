# Use a imagem base do Ubuntu
FROM ubuntu:20.04

# Defina o diretório de trabalho
WORKDIR /NAO

# Instale dependências adicionais
RUN apt-get update && apt-get install -y \
    tmux \
    openssh-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instale dependências
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    bzip2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Baixe e instale o Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
    && bash miniconda.sh -b -p /opt/miniconda3 \
    && rm miniconda.sh

# Adicione o Miniconda ao PATH
ENV PATH="/opt/miniconda3/bin:${PATH}"

# Crie os ambientes virtuais com conda
RUN conda create -y -n env_python2 python=2.7 \
    && conda create -y -n env_python3 python=3.12

# Ative o ambiente do Python 3 e instale as bibliotecas necessárias
RUN /opt/miniconda3/bin/conda run -n env_python3 pip install SpeechRecognition openai python-dotenv

# Baixe e instale o SDK do NAO
ADD pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327.tar.gz .

# Copie os arquivos de correção do boost
COPY boost/* /NAO/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327/

# Defina variáveis de ambiente para o SDK do NAO
ENV PYTHONPATH=${PYTHONPATH}:/NAO/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH="/NAO/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327:$LD_LIBRARY_PATH"

# Copie todos os arquivos da máquina local para o diretório de trabalho
COPY . .

# Copie o script de entrada e torne-o executável
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponha a porta 9559
EXPOSE 9559

# Comando para rodar o container
ENTRYPOINT ["/entrypoint.sh"]
