#!/bin/bash
clear

main(){
    echo "[ 1 ] Adicionar Usuário"
    echo "[ 2 ] Atualizar a lista de pacotes"
    echo "[ 3 ] Instalar Programa"
    echo "[ 4 ] Realizar Backup"
    echo "[ 5 ] Sair"
    echo
    echo -n "Qual a opcao desejada ? "
    read OPCAO
    case $OPCAO in
        1) adicionar ;;
        2) atualizar ;;
        3) instalar ;;
        4) backup ;;
        5) exit ;;
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

instalar(){
    echo "Digite o nome do programa que deseja instalar"
    read PROGRAMA
    sudo apt install $PROGRAMA
        main
}

backup(){
    echo "Especifique o local a ser backupeado ? "
    read LOCAL 
    echo "_______________________________"
    echo
    echo "Especifique o nome do Arquivo de Backup ? "
    read NOME
    echo
    echo "_______________________________"
    echo "Especifique o destino do Backup ? "
    read DESTINO
    sudo tar cvf $DESTINO/$NOME.tar $LOCAL
    cd $DESTINO
    ls $NOME
        main
}

main $@