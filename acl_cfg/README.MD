# Gerenciador de permissões ACL

### Shell Script projetado para listar, adicionar ou remover permissões ACL em um sistema Linux.

DICA: Caso o nome do diretório o qual deseja manipular as permissões tenha espaços, sempre digite o mesmo entre áspas simples.
Ex.: 'Minha pasta ACL'

#### Primeiros passos:

1. Após executar o clone, entre na pasta acl_cfg do repositório em seu terminal de comandos padrão Linux.

2. Digite ```./acl_cfg.sh``` e pressione ENTER.

3. Um menu inicial será aberto indicando todas as opções do script.

#### Opções do menu inicial:

1. Listar permissões:
Pergunta pelo caminho completo de um diretório e exibe todas as permissões ACL atuamente configuradas no mesmo.

2. Adicionar permissão:
Adiciona uma permissão ACL a um diretório, o script pergunta pelo caminho do diretório, usuário que será adicionado e o nível de acesso que este usuário irá ter na pasta, podendo ser leitura ou leitura/gravação.

3. Remover permissão:
Remove um usuário da lista de permissões ACL de um diretório especificado.