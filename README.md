# LLM_NAO_DOCKER


Tabela de conteúdos
=================
<!--ts-->
   * [Sobre](#sobre)
   * [Pré-Requisitos](#pré-requisitos)
   * [Instalação](#instalação)
<!--te-->

## Sobre
Conteinerização do projeto "https://github.com/Samuellps/NAO", que tem como objetivo de desenvolver a função de diálogo com o robô NAO da por meio da implementação de uma LLM.

## Pré-Requisitos
Para criar um container do projeto, é preciso clonar o projeto em uma pasta, isto pode ser feito com o comando:<br/><br/>
`git clone https://github.com/viniciustormin/LLM_NAO_DOCKER.git`<br/><br/>
Também será preciso ter o Docker Desktop instalado no computador e baixar o arquivo do pynaoqi, caso não tenha, baixe-os por estes links: [docker](https://www.docker.com/products/docker-desktop/) [pynaoqi](https://community-static.aldebaran.com/resources/2.8.6/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327.tar.gz).
Além disso, abra o arquivo NAO27.py e troque a variável "ip" pelo ip do seu NAO, é possivel descobrir isso apertando o botão no peito do NAO.
Por fim, será necessário que o seu computador tenha arquitetura AMD64 ou x86_64.

## Instalação
Para construir e iniciar o container da aplicação, será necessário, primeiramente, abrir o programa do Docker Desktop e deixa-lo aberto, então abrir o terminal e navegar até a pasta clonada utilizando o comando:<br/><br/>
`cd .../LLM_NAO_DOCKER`<br/><br/>
Então construimos o container utilizando o comando:<br/><br/>
`docker build -t llm_nao_docker .`<br/><br/>
Assim o container começará o processo de construção, e ao fim, poderemos iniciar o container com o comando:<br/><br/>
`docker run -it llm_nao_docker`<br/><br/>
Com o container rodando e aberto em seu terminal, é possivel transitar entre os programas rodados em Python 3 e Python 2.7 utilizando o atalho `Ctrl+B` e em seguida pressionar os numerais `0` e `1` para transitar entre os terminais do container.
