#!/bin/bash
set -e

echo "#---Atualizando pacotes do sistema---#"
sudo apt update && sudo apt upgrade -y

echo "#---Instalando Flatpak---#"

if ! command -v flatpak &> /dev/null; then

    echo "Flatpak não está instalado."
    echo "#---Instalando Flatpak---#"	

    sudo apt install -y flatpak

else
    echo "Flatpak já está instalado."
fi

echo "#---Instale o plug-in Flatpak do software GNOME---#"
sudo apt install -y gnome-software-plugin-flatpak

echo "#---Adicionando repositório do Flathub---#"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#verificar se os software estão instalados ou não 
verificar_software_flatpak() {
    flatpak list --app | grep -q "$1"
}

#01 GNU PSPP
if verificar_software_flatpak "org.gnu.pspp"; then
  echo "GNU PSPP já está instalado!"
else
  echo "#---Instalando GNU PSPP---#"
  flatpak install -y flathub org.gnu.pspp
fi

#02 Jamovi
if verificar_software_flatpak "org.jamovi.jamovi"; then
  echo "Jamovi já está instalado!"
else
  echo "#---Instalando Jamovi---#"
  flatpak install -y flathub org.jamovi.jamovi
fi

#03 OnlyOffice
if verificar_software_flatpak "org.onlyoffice.desktopeditors"; then
        echo "ONLYOFFICE Desktop já está instalado"
else
        echo "#---Instalando ONLYOFFICE Desktop---#"
        flatpak install -y flathub org.onlyoffice.desktopeditors
fi

#04 Zotero
if verificar_software_flatpak "org.zotero.Zotero"; then
        echo "Zotero já está instalado"
else
        echo "#---Instalando Zotero---#"
        flatpak install -y flathub org.zotero.Zotero
fi

#05 PDF Slicer
if verificar_software_flatpak "com.github.junrrein.PDFSlicer"; then
        echo "PDF Slicer já está instalado!"
else
        echo "#---Instalando PDF Slicer---#"
        flatpak install -y flathub com.github.junrrein.PDFSlicer
fi


#06 QGIS Desktop
if verificar_software_flatpak "org.qgis.qgis"; then
        echo "QGIS Desktop já está instalado!"
else
        echo "#---Instalando QGIS versão LTS---#"
        flatpak install -y flathub org.qgis.qgis//lts
fi

#07 JASP
if verificar_software_flatpak "org.jaspstats.JASP"; then
        echo "JASP já está instalado!"
else
        echo "#--- Instalando JASP---#"
        flatpak install -y flathub org.jaspstats.JASP
fi


verificar_r_e_rstudio() {
    echo "Verificando se o R está instalado..."
    if command -v R >/dev/null 2>&1; then
        echo "R está instalado."
    else
        echo "R não está instalado."
        sudo apt install -y r-core-base

    fi

    echo "Verificando se o RStudio está instalado..."
    if command -v rstudio >/dev/null 2>&1; then
        echo "RStudio está instalado."
    else
        echo "RStudio não está instalado."
        wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2025.05.0-496-amd64.deb
        sudo apt install -y ./rstudio-2025.05.0-496-amd64.deb
    
    fi
}

# Chama a função para verificar R e Rstudio
verificar_r_e_rstudio


echo "#---Instalação concluída com sucesso!---#"

echo "#---Limpeza de pacotes não utilizados/cache--#"
sudo apt autoremove -y && sudo apt autoclean && sudo apt clean

echo "#---Operações finalizadas com sucesso!!!---#"                                       
