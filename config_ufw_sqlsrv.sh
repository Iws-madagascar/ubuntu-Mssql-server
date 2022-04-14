#!/bin/bash
####################################################################
#### ufw for Ms-SQL server                        	            ####
#### and Ubuntu Servers.                                        ####
#### Author: Itibar Aheshman    14/04/2022                      ####
#### Contact: aheshman@iws.mg                                   ####
#### Version 1                                               ####
####                                                            ####
#### To use this script chmod it to 755                         ####
#### or simply type bash <install.sh>                           ####  
####################################################################

sudo ufw allow 22
sudo ufw allow 1433
sudo ufw allow 1434
sudo ufw enable
