#!/bin/bash
####################################################################
#### Sql server 2022 install Script for ubuntu 20	            ####
#### and Ubuntu Servers.                                        ####
#### Author: Itibar Aheshman    14/04/2022                      ####
#### Contact: contact@mylinux.work                              ####
#### Version 1.30                                               ####
####                                                            ####
#### To use this script chmod it to 755                         ####
#### or simply type bash <install.sh>                           ####  
####################################################################


sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
sudo apt update
sudo apt install -y mssql-server

sudo /opt/mssql/bin/mssql-conf setup


systemctl status mssql-server --no-pager

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

sudo apt update 
sudo apt install -y mssql-tools unixodbc-dev

sudo apt install net-tools
sudo netstat -tnlp | grep sqlservr
