#!/usr/bin/env zsh
# Author - Haron Prime
# License WTFPL © 2017 http://www.wtfpl.net/

alias as='yay --color auto -Syu'        # Синхронизация с репозиторием перед обновлением пакетов (включая AUR)
alias asu='yes|yay -Syu --noconfirm --nedded'                   # То же, что и ypg, но без подтверждения.
alias a='yay --color auto'           # Установка определенных пакетов из репозитория
alias au='yay -U'                       # Установить конкретный пакет не из репозиториев, а из файла
alias ar='yay -R'                        # Удаление указанного пакета(ов), сохранив его конфигурацию(и) и необходимые зависимости
alias ap='yay -Rnsc'                     # Удаление указанного пакета(ов), его конфигурацию(и) и ненужные зависимости
alias ai='yay --color auto -Si'         # Отображение информации о данном пакете в репозиториях
alias yl='yay -Qi'                      # Отображение информации о данном пакете в локальной базе данных
alias yls='yay -Qs'                     # Поиск пакета(ов) в локальной базе данных
alias ylist='yay -Qe'                      # Список установленных пакетов, даже установленных из AUR (они помечены как "локальные")
alias yrph='yay -Qtd'                    # Удаление пакетов сирот через yay
# Additional yay alias examples
if [[ -x `command -v abs` && -x `command -v aur` ]]; then
    alias af='yay --color auto -Sy && sudo abs && sudo aur'  # Update and refresh the local package, ABS and AUR databases against repositories
elif [[ -x `command -v abs` ]]; then
    alias alf='yay --color auto -Sy && sudo abs'              # Update and refresh the local package and ABS databases against repositories
elif [[ -x `command -v aur` ]]; then
    alias aupd='yay --color auto -Sy && sudo aur'              # Update and refresh the local package and AUR databases against repositories
else
    alias yupd='yay --color auto -Sy'                          # Update and refresh the local package database against repositories
fi
alias yinsd='yay --color auto -S --asdeps'                     # Install given package(s) as dependencies of another package
alias ymir='yay --color auto -Syy'                             # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
