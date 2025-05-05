# Automatização de Instalações - Shell Script

## Objetivo
Este repositório contém um Shell Script (Bash) projetado para automatizar o processo de instalação de softwares e dependências em sistema operacional Linux Mint Mate 20.3 "Una", com foco na padronização dos ambientes dos computadores do laboratório de informática do IFCH-UFPA.

## Funcionalidades

- São dois scripts que realizam os seguintes operações:

1. Atualização dos pacotes do sistema;
2. Instalações de dependências básicas;
3. Verificações e instalações de softwares;
4. Feedback visual ao final dos procedimentos.

Os softwares que serão instalados:
- GNU PSPP
- Jamovi
- ONLYOFFICE
- Zotero
- PDF Slicer
- JASP
- QGIS Desktop
- R
- RStudio

## Como executar

- Aviso: Este script foi desenvolvido e testado em sistema operacional Linux Mint Mate 20.3 "Una", se for utilizado em outra distribuição Linux, pode não funcionar sem ajustes adicionais ou adaptação do código. 

### 1. Permissão de execução 

- Instalador-softwares.sh:

```Bash
chmod +x Instalador-softwares-flatpak.sh
```

- Instalador-r-rstudio.sh:
```Bash
chmod +x Instalador-R-and-RStudio.sh
```

### 2. Execução

- Instalador-softwares.sh:
```Bash
./Instalador-softwares-flatpak.sh
```
- Instalador-r-rstudio.sh:
```Bash
./Instalador-R-and-RStudio.sh
```

## Contribuições
Críticas construtivas e contribuições são bem-vindas, fique à vontade para abrir issues ou pull requests.

## Referências

[Flathub](https://flathub.org/) 

[JASP](https://jasp-stats.org/) 

[RStudio Desktop](https://posit.co/download/rstudio-desktop/)

# Licença 
Este projeto está licenciado sob a MIT License.




