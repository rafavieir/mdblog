date: 16-09-23
title: estrutura org
category: teste

![Alt text](../../static/maquina-de-escrever.png)


# Estrutura Organizacional do Blog

Este documento descreve a estrutura organizacional do blog, desde as categorias nas quais irei escrever até as ferramentas utilizadas na construção do blog.

## Construção do Blog

Optei por utilizar o Flask para estruturar este projeto. Uma abordagem interessante foi criar a estrutura do projeto para converter arquivos Markdown em posts do site, o que economizou tempo na edição dos posts. Segui o exemplo a seguir para iniciar:

[Simple Static Markdown Blog in Flask](https://www.jamesharding.uk/posts/simple-static-markdown-blog-in-flask/)

O projeto está funcionando com algumas alterações:

### A Fazer

- Melhorar a renderização do Markdown nos posts (concluído).
- Filtrar a listagem e não exibir arquivos declarados como `.init` na categoria.
- Criar um filtro para listar por meio de um combobox.
- Melhorar sistemas e funções das rotas 
- Armazenar os posts em uma pasta no Google Drive.
- Melhorar os processos shell.
- Criar um Dockerfile.
- Melhorar a segurança.
