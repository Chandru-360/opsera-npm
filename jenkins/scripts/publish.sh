echo 'Nesta etapa o Jenkins irá publicar o código na branch "prod" do repositório no Github '

set -x
git branch
git prod
git merge origin/development
