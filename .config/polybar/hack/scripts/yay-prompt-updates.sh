#! /bin/bash
ALL=$(yay -Qu --devel --timeupdate | sed 's/\x1b\[[0-9;]*m//g' | sed 's/->//g' | sed 's/^/TRUE /g')
if [[ -z "${ALL// }" ]]
then
  echo "Finalizando, atualizações não encontradas."
  exit 0
else
    echo "Vai exibir o diálogo com as opções."
    UPDATE=$(zenity --list \
    --width=500 --height=400 \
    --text="Select updates to install:" \
    --checklist \
    --separator=" " \
    --title="The following packages are outdated" \
    --column="Update" --column="Package Name" --column="Previous Version" --column="Current Version" \
    $ALL)
    echo $UPDATE
    if [[ -z "${UPDATE// }" ]]
    then
        exit 0
    else
        RESULT=$(konsole -e "yay -S $UPDATE")
    fi
    echo "Requesting Update: $UPDATE"
fi
exit 0