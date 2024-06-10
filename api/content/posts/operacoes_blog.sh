#!/bin/bash

listar_arquivos (){
    echo "Nome do Arquivo        Data de Modificação"
    echo "---------------------- ----------------------"
    for arquivo in *.md; do
        nome_arquivo="$arquivo"
        data_modificacao=$(stat -c "%y" "$arquivo" | cut -d '.' -f 1)
        printf "%-23s %-23s\n" "$nome_arquivo" "$data_modificacao"
    done
}

menu() {
    clear
    echo "===== BLOG MARKDOWN.SH ====="
    echo "Escolha uma opção:"
    echo "1. Excluir um arquivo"
    echo "2. Abrir um arquivo"
    echo "3. Criar um novo arquivo"
    echo "4. Criar categorias"
    echo "5. Enviar arquivos para o blog"
    echo "6. Sair"
    echo "================================"
    echo -n "Digite o número da opção desejada: "
}

excluir_arquivo() {
    clear
        listar_arquivos
        read -p "Digite o nome do arquivo que deseja excluir: " arquivo_excluir
        if [ -f "$arquivo_excluir" ]; then
            rm "$arquivo_excluir"
            echo "Arquivo $arquivo_excluir excluído com sucesso."
        else
            echo "O arquivo $arquivo_excluir não foi encontrado."
        fi
}

abrir_arquivo() {
    clear
    listar_arquivos
    read -p "Digite o nome do arquivo que deseja abrir: " arquivo_abrir
     if [ -f "$arquivo_abrir" ]; then
            vi "$arquivo_abrir"
            read -p "Pressione Enter para continuar após fechar o arquivo." wait
            abrir_arquivo
        else
            echo "O arquivo $arquivo_abrir não foi encontrado."
        fi
}

criar_arquivo() {
    echo "criar_arquivo"
    clear
    read -p "Digite o titulo de seu arquivo: " arquivo_criar
    if [ -f "$arquivo_criar".md ]; then
            echo "O arquivo $arquivo_criar já existe."                       
            
    else
            touch "$arquivo_criar".md
            echo "Arquivo $arquivo_criar criado com sucesso!!!"
            
    fi
    read -p "Deseja criar outro arquivo? (S/n): " criar_outro
    if [ "$criar_outro" = "S" ] || [ "$criar_outro" = "s" ]; then
        criar_arquivo 
    else
        menu
    fi
}

criar_categorias() {
    echo "criar_categorias" 
}


enviar_arquivos_git() {

FILE_PATH="./novo_post.md"  # Caminho completo para o novo arquivo no repositório
COMMIT_MESSAGE="Adicionando novo post"

# Crie um novo arquivo vazio usando o comando 'touch'
# Adicione o novo arquivo ao Git
git pull origin main  # Substitua 'main' pelo nome do branch desejado

git add "$FILE_PATH" .

# Faça o commit das alterações com uma mensagem de confirmação
git commit -m "$COMMIT_MESSAGE"

# Empurre as alterações para o repositório remoto (substitua 'origin' pelo nome do seu remote, se necessário)
git push origin main  # Substitua 'master' pelo nome do branch desejado

# Mensagem de confirmação
echo "Novo arquivo criado e enviado com sucesso para o repositório Git!"

}
menu

read -p "Digite o número da opção desejada: " opcao

case $opcao in
    1)
        clear
        listar_arquivos
        excluir_arquivo
        ;;
    2)
        clear
        listar_arquivos
        abrir_arquivo
        ;;
    3)  
        clear
        listar_arquivos
        criar_arquivo
        ;;
    
    4)
        clear
        listar_arquivos
        criar_categorias
        ;;
    
    5)
        enviar_arquivos_git
        exit 0
        ;;
    *)
        menu
        ;;
esac