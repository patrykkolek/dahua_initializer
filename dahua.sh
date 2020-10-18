
cat logo1.txt
echo "              Dahua H@XX script by Nudziarz 3:> "
echo -e "\e[1;31m wcisnij klawisz by zaczac \e[0m"
read Klawisz
echo -e "\e[1;33m inicjalizuje kamere \e[0m"
selenium-side-runner -c "browserName=firefox moz:firefoxOptions.args=[-headless] " dahua.side
#test
if selenium-side-runner -c "browserName=firefox moz:firefoxOptions.args=[-headless] " dahua.side ; then
    echo success
else
    echo fail sprobujmy innej konfiguracji
   selenium-side-runner -c "browserName=firefox moz:firefoxOptions.args=[-headless] " dahuaff.side
fi
#test
echo""
echo "konfiguracja adresacji:"
echo -e "\e[1;33m Podaj adres IP: \e[0m"
read IP
echo "IP: $IP"
echo -e "\e[1;33m Podaj adres bramy (sugeruje uzyc adresu rejestratora)  \e[0m"
read GW
echo "brama: $GW"
echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

google-chrome  " http://admin:1qwerty231@192.168.1.108/cgi-bin/configManager.cgi?action=setConfig&Network.eth0.IPAddress=$IP&Network.eth0.DefaultGateway=$GW&Network.eth0.SubnetMask=255.255.255.0"

echo "END..."
