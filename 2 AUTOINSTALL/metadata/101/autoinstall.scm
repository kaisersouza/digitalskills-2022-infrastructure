; установка языка операционной системы (ru_RU)
("/sysconfig-base/language" action "write" lang ("ru_RU"))
; установка переключателя расладки клавиатуры на Ctrl+Shift
("/sysconfig-base/kbd" action "write" layout "ctrl_shift_toggle")
; установка часового пояса в Europe/Moscow, время в BIOS будет храниться в UTC
("/datetime-installer" action "write" commit #t name "RU" zone "Europe/Moscow" utc #t)
; автоматическая разбивка жёсткого диска
("/evms/control" action "write" control open installer #t)
("/evms/control" action "write" control update)
("/evms/profiles/workstation" action apply commit #f clearall #t exclude ())
("/evms/control" action "write" control commit)
("/evms/control" action "write" control close)
; установка пакетов операционной системы
("pkg-init" action "write")
; установка только базовой системы (дополнительные группы пакетов из pkg-groups.tar указываются по именам через пробел)
("/pkg-install" action "write" lists "" auto #t)
("/preinstall" action "write")
; установка загрузчика GRUB в MBR на первый жёсткий диск
("/grub" action "write" device "/dev/sda" passwd #f passwd_1 "*" passwd_2 "*")
; настройка сетевого интерфейса на получение адреса по DHCP
("/net-eth" action "write" name "ens19" configuration "static" default "10.10.10.1" search "" dns "78.37.77.77" computer_name "k8s-master1-1.dtd" ipv "4" ipv_enabled #t)
("/net-eth" action "add_iface_address" name "ens19" addip "10.10.10.101" addmask "24" ipv "4")
("/net-eth" action "write" commit #t)
; установка пароля суперпользователя root '123'
("/root/change_password" language ("ru_RU") passwd_2 "toor2000!" passwd_1 "toor2000!")
; задание первого пользователя 'test' с паролем '123'
("/users/create_account" new_name "ansible" gecos "" allow_su #t auto #f passwd_1 "ansible123" passwd_2 "ansible123")
("/postinstall/firsttime" script  "http://10.10.10.100/post.sh")

