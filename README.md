# Dotfiles

![1](Imagens/1.png)

![2](Imagens/2.png)

## Plasmoids adicionais utilizados

* [Simple Customizable Power Menu for KDE](https://store.kde.org/p/2137217)
* [plasmusic-toolbar](https://store.kde.org/p/2128143)
* [Separator Line](https://store.kde.org/p/2136852)
* [Condensed Weather [Plasma 6]](https://store.kde.org/p/2137197)
* [Command Output](https://store.kde.org/p/2136636/)

### Comandos do plasmoid Command Output

* Atualizações do Arch Linux: `echo -e "\033[38;5;69m\033[0m $(checkupdates | wc -l)"`
    * Comando de click: `updates=$(checkupdates | wc -l); if [ "$updates" -gt 0 ]; then konsole -e /bin/bash -c "yay -Syu --devel --timeupdate; read -p 'Pressione Enter para finalizar...' "; fi`
* Velocidade Internet: `sleep 10 && if ping -c 1 8.8.8.8 &>/dev/null; then echo -e "\033[38;5;222m\033[0m $(speedtest --secure --no-upload --simple | awk 'NR==2{print $2" Mbps"}')"; else echo -e "\033[38;5;204m\033[0m"; fi`
* Uso de memória: `free -h | awk '/Mem/{printf("\033[38;5;120m\033[0m %s "), $3}'`
* Uso de CPU: `echo "  "echo -e "\033[38;5;204m\033[0m "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"`