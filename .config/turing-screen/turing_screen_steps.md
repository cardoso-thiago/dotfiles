# Passos no Arch Linux

- Clonar o repositório: `git clone git@github.com:mathoudebine/turing-smart-screen-python.git`
- Acessar a pasta: `cd turing-smart-screen-python`
- Criar o Virtual Environment: `python3 -m venv venv`
- Ativar o Virtual Environment: `. venv/bin/activate`
- Instalar as dependências: `python3 -m pip install -r requirements.txt`
- Validar se o `tk` está instalado: `python3 -c "import tkinter; tkinter._test()"`
- Se não estiver, instalar com: `yay -S tk`
- Listar os dispositivos disponíveis: `ls /dev/tty*`
- Se não for possível acessar os dispositivos, adicionar o usuário aos grupos para acesso serial: `sudo usermod -a -G uucp $USER` e `sudo usermod -a -G lock $USER`. Reiniciar a máquina para ativar.
- Configuração inicial: `python3 configure.py`
- Iniciar a execução `python3 main.py`

## Simulação de display

- Após iniciar o programa de forma simulada, ele irá gerar um print da execução. É possível acessar o `http://localhost:5678/` no navegador para visualização contínua.

## Guias

- https://phazertech.com/tutorials/turing-smart-screen.html
- https://github.com/mathoudebine/turing-smart-screen-python