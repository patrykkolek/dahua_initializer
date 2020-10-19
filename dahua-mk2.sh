
cat logo.txt
echo "              Dahua H@XX script by Nudziarz 3:> "
echo -e "\e[1;31m wcisnij klawisz by zaczac \e[0m"
read Klawisz
echo -e "\e[1;33m Podaj adres IP: \e[0m"
read IP
echo -e "\e[1;33m Podaj adres bramy (sugeruje uzyc adresu rejestratora)  \e[0m"
read GW
#polecenie do sprawdzania czy kamerka bangla
echo -e "\e[1;33m Sprawdzmy czy kamera jest podpieta..\e[0m" 
while ! httping -qc1 192.168.1.108 &> /dev/null
do 
printf "."
done
echo""
echo -e "\e[1;32m  kamera podpieta !\e[0m"
#koniec
#init kamery na defaultowym adresie
echo -e "\e[1;33m inicjalizuje kamere \e[0m" 
#warunek sprawdzajacy wykonanie initu
if selenium-side-runner -c "browserName=firefox moz:firefoxOptions.args=[-headless]" dahua.side ; then
    echo -e "\e[1;32m Sukces !\e[0m"
else
    echo -e "\e[1;31m fail! \e[1;39m sprobujmy innej konfiguracji (niektore kamery maja problem z tłumaczeniem) \e[0m" 
    #echo "fail sprobujmy innej konfiguracji (niektore kamery maja problem z tłumaczeniem)"
   selenium-side-runner -c "browserName=firefox moz:firefoxOptions.args=[-headless]" dahuaff.side
fi
#koniec warunku
echo""
echo "konfiguracja adresacji:"
echo -e "\e[1;31m adres IP : \e[1;33m $IP \e[0m"
echo -e "\e[1;31m Brama Glowna: \e[1;33m $GW \e[0m"  
echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

google-chrome  " http://admin:1qwerty231@192.168.1.108/cgi-bin/configManager.cgi?action=setConfig&Network.eth0.IPAddress=$IP&Network.eth0.DefaultGateway=$GW&Network.eth0.SubnetMask=255.255.255.0"

echo "Zakonczono "
