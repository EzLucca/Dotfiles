#!/bin/bash

# Recebe o título do livro e o autor como argumentos de linha de comando
book_title=$1
author=$2

# Verifica se o título do livro foi fornecido
if [ -z "$book_title" ]; then
  echo "Erro: O título do livro não pode estar vazio."
  exit 1
fi

# Sanitiza o título do livro para criar o nome do arquivo (substitui espaços por underscores)
filename=$(echo "$book_title" | sed 's/ /_/g')

# Adiciona a data atual ao nome do arquivo
current_date=$(date +'%Y-%m-%d')
filename="${current_date}_${filename}"

# Verifica se o nome do arquivo está vazio após a sanitização
if [ -z "$filename" ]; then
  echo "Erro: Nome do arquivo gerado está vazio."
  exit 1
fi

# Define o template padrão em Markdown
template="# $book_title
**Autor:** $author  
**Data:** $(date +'%Y-%m-%d')

## Resumo

## Pontos Chave

## Citações

## Reflexões
"

# Escreve o template no arquivo com extensão .md
echo "$template" > "/home/duds/Dropbox/notes/src/${filename}.md"

# Notifica o usuário
echo "Arquivo de nota criado: ${filename}.md"

# Retorna o nome do arquivo para ser usado pelo Neovim
echo "${filename}.md"

