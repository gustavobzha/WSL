# Instalação e Customização WSL 

## Primeiro passo: Habilitar o WSL

Executar o seguinte comando no powershell como Administrador:

`dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`

## Segundo passo: Atualizar para WSL2

**Diferença entre o WSL para o WSL2:**

O WSL 2 utiliza uma arquitetura completamente diferente do WSL 1. Ao invés de traduzir as system calls, ele utiliza diretamente um kernel do Linux atualizado através de uma máquina virtual leve, rápida e altamente integrada com o Windows.

**Requisitos:**

* Para sistemas x64: **Versão 1903** ou superiores, com o **Build 18362** ou superiores.

* Para sistemas ARM64: **Versão 2004** ou superiores, com o **Build 19041** ou superiores. Os builds inferiores a **18362** não dão suporte a WSL 2.

Para verificar a sua versão e o número de build, selecione a tecla do logotipo do Windows + R, digite `winver` e selecione OK. (Ou digite o comando ver no prompt de comando do Windows).

Caso necessite de atualização, utilize o [Assistente do Windows Update](https://www.microsoft.com/software-download/windows10) para atualizar a sua versão do Windows.

Antes de instalar o WSL2, você precisa habilitar o recurso opcional **Plataforma de Máquina Virtual**. Abra o PowerShell como administrador e execute: 

`dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`

Reinicie o computador.

*OBS: Pode ser necessário também habilitar a virtualização (Hyper-V) na sua placa-mãe através da BIOS.*


## Terceiro passo: Baixar o pacote de atualização do kernel do Linux

Para fazer o Download clique [aqui](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

## Quarto passo: Definir o WSL2 como a sua versão padrão

Digite o seguinte comando no PowerShell como Administrador:

`wsl --set-default-version 2`

## Quinto passo: Instalar a distribuição Linux de sua preferência

*Importante: O script de configuração foi feito para ser utilizado no Ubuntu, então é altamente recomendado que ele seja instalado para que não necessite fazer alteraçõesn o script manualmente*

Ubuntu 20.04 LTS [Download](https://www.microsoft.com/en-us/p/ubuntu-2004-lts/9n6svws3rx71?activetab=pivot:overviewtab)

---

### Opcionais

##### Windows Terminal

Instale o [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)

</br>

##### VcXsrv Windows X server

Este programa é necessário para rodar aplicações gráficas Linux no Windows, também nos ajudará com o clipboard do nvim caso queira utilizá-lo no lugar de outro editor como VS Code.

[Download](https://sourceforge.net/projects/vcxsrv)
</br>

*Configure o Firewall do Windows para não acabar bloqueando o App:*

Windows Defender Firewall &#8594; Advanced Settings &#8594; Inbound Rules &#8594; botão direito em “VcXsrv windows xserver de profile “public” e protocol “TCP” e vá em properties &#8594; Scope, em “Remote IP address” selecione “These IP addresses” e clique em Add e adicione o seguinte ip : 172.16.0.0/12 
após isso basta dar “Apply” e “Ok”. Isso irá limitar as sub-redes que podem acessar as portas para a sub-rede WSL. 

*Configuração Xlauncher para inicilizar junto com o Windows:*

Abra também o Xlauncher, deixe selecionado em “Multiple windows” e “Display number = -1”, Next, Next, e em Additional parameters for VcXsrv adicione “-ac” para liberar o controle de acesso do display, após isso vá em Next e “Save configuration”, salve o arquivo no caminho seu_usuário>AppData>Roaming>Microsoft>Windows>Start Menu>Programs>Startup.
Após isso clique em Finish.

---

## Customização do Sistema

Após instalar sua Distribuição e criar seu usuário e senha, digite o seguintes comandos no seu SubSystem Linux:

```sudo apt update && sudo apt upgrade -y
git clone https://github.com/gustavobzha/WSL.git
cd WSL
./install 
```
