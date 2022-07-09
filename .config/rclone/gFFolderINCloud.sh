#!/usr/bin/sh
# 'copy': Copy the files from the local computer to the remote storage, skipping over files that are already present on the remote storage.
#Скопируйте файлы с локального компьютера в удаленное хранилище, пропуская файлы, которые уже присутствуют в удаленном хранилище.
#
# '––update': Skip any files that are on the remote storage that have a modified time that is newer than the file on the local computer.
#Пропускайте любые файлы на удаленном хранилище, время изменения которых новее, чем файл на локальном компьютере.
#
# '––verbose': Gives information about every file that is transferred.
#Предоставляет информацию о каждом переданном файле
#
# '––transfers 30': This sets the number of files to copy in parallel.
#Это устанавливает количество файлов для параллельного копирования.
#
# '––checkers 8': How many “checkers” to run in parallel. Checkers monitor the transfers that are in progress.
#
# '––contimeout 60s': The connection timeout. It sets the time that rclone will try to make a connection to the remote storage.
#Тайм-аут соединения. Устанавливает время, в течение которого rclone попытается подключиться к удаленному хранилищу.
#
# '––timeout 300s': If a transfer becomes idle for this amount of time, it is considered broken and is disconnected.
#Если передача неактивна в течение этого времени, она считается прерванной и отключается.
#
# '––retries 3': If there are this many errors, the entire copy action will be restarted.
#Если ошибок так много, все действие копирования будет перезапущено.
#
# '––low-level-retries 10': A low-level retry tries to repeat one failing operation, such as a single HTTP request. This value sets the limit for the number of retries.
#Повторная попытка на низком уровне пытается повторить одну неудачную операцию, например, один HTTP-запрос.
#Это значение устанавливает ограничение на количество повторных попыток.
#
# '––stats 1s': rclone can provide statistics on the transferred files. This sets the frequency of update of the statistics to one second.
#rclone может предоставить статистику по переданным файлам.
#Это устанавливает частоту обновления статистики в одну секунду.
#
# “/home/kalex/GDisk/RSL_Иллюстрации_к_служению/”: The local directory to we’re going to copy to the remote storage.
#Локальный каталог, который мы собираемся скопировать в удаленное хранилище
#
# “GoogleDisk:RSL_Иллюстрации_к_служению”: The destination directory in the remote storage. Note the use of “GoogleDisk”, which is the name we gave to this remote connection during the the rclone config sequence. Also note the colon “:” that is used as a separator between the remote storage name and the directory name. Subdirectories are separated by the usual “/” forward slash. If the destination directory does not exist, it will be created.
#Каталог назначения в удаленном хранилище.
#Обратите внимание на использование «GoogleDisk», которое является именем, которое мы дали этому удаленному подключению во время последовательности настройки rclone.
#Также обратите внимание на двоеточие «:», которое используется как разделитель между именем удаленного хранилища и именем каталога.
#Подкаталоги разделяются обычной косой чертой «/».
#Если целевой каталог не существует, он будет создан.

cd $HOME/GDisk/RSL_Иллюстрации_к_служению/

/usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/kalex/GDisk/RSL_Иллюстрации_к_служению/" "GDisk:RSL_Иллюстрации_к_служению"



# rclone copy /path/to/file remote:dir/newfilename puts file into dir, but renames it to newfilename.
