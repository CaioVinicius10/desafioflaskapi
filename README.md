## Criação e configuração do Dockerfile

Inicialmente escolhi a versão da imagem python:3.9-slim para a execução do projeto.

Em seguida criei o diretorio /app.

Copiei da minha raiz do projeto o package.json para diretorio /app.

Executando os comando yarn install, pip3 install para instalação de dependências do projeto  nesse caso o pacote do flask que foi importado no commenty.py

Agora utilizando o COPY estou copiando todos os meus arquivos da raiz do projeto para o diretorio /app.

Logo após utilizando o comando para execução do projeto com o CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"].

## Criação do requirements.txt
Arquivo .txt com o import necessario do Flask para execução da aplicação.

### Build do Dockerfile

Para etapa do build utilizei essa action: RafikFarhad/push-to-gcr-github-action@v5-rc1, 

### Criação do pipe.yaml

Nesse workflow utilizei apenas 1 job o build-and-push-gcp contendo o build e deploy no cloud run, o deploy no cloud run utlizei a propria action do cloud-run: google-github-actions/deploy-cloudrun@v2, e setei algumas flags necessarias para execução do projeto. Utilizei alguns repository secrets para seguir uma boa pratica de segurança e não passar informações sensiveis no workflow, GCP_KEY - Service Acconut responsavel pelo build e envio da imagem para o artifact regsitry(GCP), GCP_ARTIFACT_REGISTRY - 


### Links

imagem Dockerhub - https://hub.docker.com/repository/docker/caio10/desafioreact

deploy heroku - https://reactjsdesafio.herokuapp.com/

gitlab - https://gitlab.com/CaioVinicius10/desafioreactjs
