#! /bin/bash
ALL=$(yay -Qu --devel --timeupdate | sed 's/\x1b\[[0-9;]*m//g' | sed 's/->//g' | sed 's/^/TRUE /g')
if [[ -z "${ALL// }" ]]
then
  notify-send -i /usr/share/pixmaps/archlinux-logo.png "Não foram encontradas atualizações."
  exit 0
else
    qdbus org.kde.yakuake /yakuake/sessions runCommand "yay -Syu --devel --timeupdate"
    notify-send -i /usr/share/pixmaps/archlinux-logo.png "Comando de atualização enviado para o Yakuake."
fi
exit 0