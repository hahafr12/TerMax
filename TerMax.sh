#!/data/data/com.termux/files/usr/bin/bash

# Renkler
green="\e[32m"
red="\e[31m"
reset="\e[0m"

# Şifre kontrolü
echo -e "${green}Termux Otomasyon Sistemine Hoş Geldiniz${reset}"
read -p "Lütfen anahtar kelimeyi girin: " girilen_sifre

dogru_sifre="adminpro"

if [ "$girilen_sifre" != "$dogru_sifre" ]; then
    echo -e "${red}[!] Hatalı şifre. Erişim reddedildi.${reset}"
    exit 1
fi

# Giriş başarılı
echo -e "${green}[✓] Giriş başarılı.${reset}"
echo -e "${green}[*] Kurulum başlatılıyor...${reset}"

# Güncelleme ve temel paketler
pkg update -y && pkg upgrade -y
pkg install -y git wget curl python python2 ruby unzip figlet toilet

# Menü
while true; do
    echo -e "\n${green}Popüler Araçlar:${reset}"
    echo "1) Nmap"
    echo "2) Hydra"
    echo "3) SQLMap"
    echo "4) Metasploit"
    echo "5) Ngrok"
    echo "6) Hepsini Kur"
    echo "0) Çıkış"
    read -p "Seçiminiz > " secim

    case $secim in
        1)
            pkg install nmap -y
            echo -e "${green}[✓] Nmap kuruldu.${reset}"
            ;;
        2)
            pkg install hydra -y
            echo -e "${green}[✓] Hydra kuruldu.${reset}"
            ;;
        3)
            git clone https://github.com/sqlmapproject/sqlmap
            echo -e "${green}[✓] SQLMap klonlandı. ./sqlmap/sqlmap.py ile çalıştırabilirsiniz.${reset}"
            ;;
        4)
            pkg install unstable-repo -y
            pkg install metasploit -y
            echo -e "${green}[✓] Metasploit kuruldu.${reset}"
            ;;
        5)
            curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
            unzip ngrok-stable-linux-arm.zip
            chmod +x ngrok
            mv ngrok $HOME/bin/
            echo -e "${green}[✓] Ngrok kuruldu. 'ngrok authtoken <token>' ile giriş yapabilirsiniz.${reset}"
            ;;
        6)
            pkg install nmap hydra unstable-repo -y
            pkg install metasploit -y
            git clone https://github.com/sqlmapproject/sqlmap
            curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
            unzip ngrok-stable-linux-arm.zip
            chmod +x ngrok
            mv ngrok $HOME/bin/
            echo -e "${green}[✓] Tüm araçlar kuruldu.${reset}"
            ;;
        0)
            echo -e "${red}[!] Çıkılıyor...${reset}"
            exit 0
            ;;
        *)
            echo -e "${red}[!] Geçersiz seçim.${reset}"
            ;;
    esac
done