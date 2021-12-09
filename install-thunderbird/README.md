# Script de instalação do Thunderbird para sistemas operacionais Linux

## Descrição

Este script tem a objetivo de servir como um instalador padrão para o cliente de e-mail Mozilla Thunderbird em qualquer sistema operacional Linux.

Por padrão o pacote de instalação oficial do Thunderbird para Linux não possui um instalador automatizado.
Após a extração do conteúdo do arquivo para uma pasta, o mesmo já estára pronto para usar, executando-se o binário "thunderbird".
Entretanto não existe a criação de nenhum atalho ou local padrão de instalação, dificultando a manutenção e utilização do mesmo.

O script identifica um arquivo de instalação do thunderbird na pasta raiz e o instala na pasta "/opt/" do sistema, realiza também a instalação de um atalho .desktop para a integração com os ambientes gráficos GNOME e outros baseados em GTK, após a instalação o arquivo de instalação é excluído da pasta raiz.

## Utilização

1. Baixe o arquivo de instalação no site oficial do Mozilla Thunderbird: [https://www.thunderbird.net/pt-BR/](https://www.thunderbird.net/pt-BR/)

2. Mova ou copie o arquivo para a pasta raiz do script.

3. Abra o terminal na pasta raiz do script e execute o script de instalaçao com privivégios de root:

    sudo ./install-thunderbird.sh