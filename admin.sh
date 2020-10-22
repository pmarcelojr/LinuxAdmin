#!/bin/bash
clear

main(){
    echo "[ 1 ]  Adicionar Usuário"
    echo "[ 2 ] Sair"
    echo
    echo -n "Qual a opcao desejada ? "
    read OPCAO
    case $OPCAO in
        1) adicionar ;;
        2) exit ;;
        *) "Opcao desconhecida." ; echo ; Principal ;;
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

main $@