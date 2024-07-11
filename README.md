## Cloud - GCP
Serviços utilizados Artifact Registry e Cloud RUN e IAM(para dar permissão na service account), optei pelo CR pelo fato de que era somente uma api, mas poderia ser implementado em um GKE.

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

Para etapa do build utilizei essa action: RafikFarhad/push-to-gcr-github-action@v5-rc1 

### Criação do pipe.yaml

Nesse workflow utilizei apenas 1 job o build-and-push-gcp contendo o build e deploy no cloud run, o deploy no cloud run utlizei a propria action do cloud-run: google-github-actions/deploy-cloudrun@v2, e setei algumas flags necessarias para execução do projeto. Utilizei alguns repository secrets para seguir uma boa pratica de segurança e não passar informações sensiveis no workflow, GCP_KEY - Service Acconut responsavel pelo build e envio da imagem para o artifact regsitry(GCP), GCP_ARTIFACT_REGISTRY - registry onde vai ser armazenado o artefato da imagem, GCP_PROJECT_ID - ID do projeto no GCP, GCP_ARTIFACT_REPOSITORY - nome do repositorio no Artifact Registry, o REPOSITORY_NAME - nome do repositorio e IMAGE_CLOUD_RUN - que é basicamente o registry com o nome da imagem já para deployar direto no cloud run e não ficar com varias secrets/env no workflow. 

No inicio do projeto utilizei algumas envs para auxiliar no processo de deploy:
  REPOSITORY_NAME: flask-api
  SERVICE: flask-api
  REGION: us-central1
Envs que podem ser espoxtas no workflow e não é sensivel.



### Links

link da aplicação - https://flask-api-yrowtuo5ya-uc.a.run.app/

github - https://github.com/CaioVinicius10/desafioflaskapi
