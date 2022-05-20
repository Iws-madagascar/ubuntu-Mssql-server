#!/bin/bash
####################################################################
#### Sql server 2022 install Script for ubuntu 20	            ####
#### and Ubuntu Servers.                                        ####
#### Author: Itibar Aheshman    20/05/2022                      ####


echo 'Bienvenu à l’installation de MSSQL 2019 Ubuntu '
PS3='Veillez choisir une option: '
foods=("Installation des paquets Microsoft" "Installation de Microsoft SQL Server 2019" "Reconfiguration MS SQL Server 2019" "Quit")
select fav in "${foods[@]}"; do
    case $fav in
        "Installation des paquets Microsoft")
            echo "Installation des paquets Microsoft"
        if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
             echo "Verification de la connexion internet effectuer lancement de la procedure"
             curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
            curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
            curl https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list | sudo tee /etc/apt/sources.list.d/mssql2019.list
            sudo apt update
            echo "Tache terminer"
        else
             echo "verifier votre connexion internet ou installé les outils net-tools"
        fi
	    # optionally call à voir
            ;;
        "Installation de Microsoft SQL Server 2019")
            echo "Installation de Microsoft SQL Server 2019"
	        sudo apt install -y mssql-server

            sudo /opt/mssql/bin/mssql-conf setup
            echo "Tache terminer"
            ;;
        "Reconfiguration MS SQL Server 2019")
            echo "Reconfiguration MS SQL Server 2019"
	    sudo systemctl stop mssql-server
             sudo /opt/mssql/bin/mssql-conf setup
	     sudo systemctl start mssql-server
             echo "Tache terminer"
	    break
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
