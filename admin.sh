#!/bin/bash
clear

main(){
    echo "[ 1 ]  Adicionar Usuário"
    echo "[ 2 ] Atualizar a lista de pacotes"
    echo "[ 3 ] Sair"
    echo
    echo -n "Qual a opcao desejada ? "
    read OPCAO
    case $OPCAO in
        1) adicionar ;;
        2) atualizar ;;
        3) exit ;;
        *) "Opcao desconhecida." ; echo ; main ;;
    esac
}

adicionar(){
    echo "Digite o nome do usuário ? "
    read USUARIO
    useradd $USUARIO
    echo "Informe a senha para o novo usuario"
    passwd $USUARIO
        main
}

atualizar(){
    echo "Atualizando a lista de pacotes do sistema"
    sudo apt update
        main
}

main $@