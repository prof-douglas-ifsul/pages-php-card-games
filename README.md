# Exemplo simples de alteração de páginas estáticas para dinâmicas

Este é uma exemplo simples de HTML com cards contendo ilustrações e informações sobre games

A página estática é tornada dinâmica, primeiramente usando uma matriz como fonte de dados e, posteriormente usando uma fonte de dados de tabelas em base de dados MySQL.

Para observar o resultado é necessário uma servidor de páginas com suporte a PHP e um servidor MySQL disponível. 

Execute o seguinte procedimento:
1. Baixar o repositório em pasta do servidor de páginas
2. A partir do arquivo SQL na pasta sql, importar em base de dados MySQL as definições de tabelas e respectivos dados
3. No arquivo includes/banco.php fazer os ajustes nos parâmetros de conexão com a base de dados
4. Testar o site no navegador
