#!/bin/bash

utok(){
	HPn=$(($HPn-$DMG))
}

ochrana(){
	if [ $DFS -eq 30 ]; then
		sance=$((1 + RANDOM % 10))
		if [ $sance -ge 3 ]; then
			echo "Ubranil ses, mas ted vetsi sanci na critical hit!"
		else
			echo "AU, dostal si zasah!"
		fi
	elif [ $DFS -eq 50 ]; then
		sance=$((1 + RANDOM % 10))
		if [ $sance -ge 5 ]; then
			echo "Ubranil ses, mas ted vetsi sanci na critical hit!"
		else
			echo "AU, dostal si zasah!"
		fi
	elif [ $DFS -eq 60 ]; then
		sance=$((1 + RANDOM % 10))
		if [ $sance -ge 6 ]; then
			echo "Ubranil ses, mas ted vetsi sanci na critical hit!"
		else
			echo "AU, dostal si zasah!"
		fi
	else
		echo "Ubranil ses, mas ted vetsi sanci na critical hit!"
	fi

}

criticalhit(){
	critsance=$((1 + RANDOM % 10))
	if [ $critsance -eq 1 ]; then
		crit=2
		utok2=$(($utok*$crit))

	else
		utok
	fi
}

clear

echo "Nic si nepamatujes, kdo jsi?: "
echo "==================================================================================================================================="
read jmeno
sleep 1

clear

echo "Cim jsi?: "
echo "==================================================================================================================================="

echo "Rytir -> HP=150, DMG=70, DFS=60, INT=20"
sleep 1
echo "Lucistnik -> HP=100, DMG=85, DFS=30, INT=60"
sleep 1
echo "Mag -> HP=110, DMG=50, DFS=50, INT=80"
echo "==================================================================================================================================="
read postava

clear

case $postava in
Rytir)
	HP=150
	DMG=70
	DFS=60
	INT=20
	;;
Lucistnik)
	HP=100
	DMG=85
	DFS=30
	INT=60
	;;
Mag)
	HP=110
	DMG=50
	DFS=50
	INT=80
	;;
Krtek)
	echo "Citis v sobe hlinu, jsi opravdu hoden teto postavy? "$jmeno"...To jmeno bude kazdy znat..."
	HP=99999999
	DMG=99999999
	DFS=99999999
	INT=99999999
	Zizaly=99999999
	;;
*)
	echo "Spatna volba"
esac

sleep 4
clear

echo "[probudis se v bahne, uprostred lesa, pred tebou stoji figura s mecem v ruce...]"
sleep 2


if [ $postava != "Krtek" ]; then
	echo "Nevis co delat, sotva vis kdo nebo co vubec jsi, ale ocividne jsi nejaky" $postava
else
	echo "Vis presne co delat, zakopes se do zeme, sezeres zizaly coz ti zvysi vsechny tve stats a pujdes ihned do boje..."
fi

sleep 8
clear

if [ $postava != "Krtek" ]; then
	echo "Rozhodni se pro akci: "
	echo "==================================================================================================================================="
	echo "1) Bojovat"
	echo "2) Utect"
	echo "3) Skryt se za stromem"
	echo "==================================================================================================================================="
	read akce
	if [ $akce = "1" ]; then
		clear
	else
		echo "Pokusis se, ale tva snaha byla marna, musis bojovat"
	fi

fi
echo "jdes do boje..."
sleep 3

echo "[...]: Vidim ze se nam tu nekdo probudil, pripraven na dalsi krok k tvemu hrobu?"
sleep 2
echo "[$jmeno]: To vis zejo ty, bambulo"
sleep 3
echo "[...]: BAMBULA?!, ja sem Alubmab!"
sleep 3
echo "[$jmeno] Ajo (vzpomenes si na jmeno cloveka ktery te prepadl, jak si ho vubec mohl zapomenout?...)"
sleep 3
echo "[Alubmab]: CO TAM TAK STOJIS!"
sleep 3
echo "(ma pravdu, celou dobu tu stojis, musis uz zautocit)"
clear
echo "(Alubmab je clovek jako ty, nema zadne specialni schopnosti...)"
echo "Alubmab -> HP=100, DMG=50, DFS=30, INT=30"
echo "==================================================================================================================================="
sleep 4

HPn=100
DMGn=50
DFSn=30
INTn=30

while true; do
	echo "Vyber akci: "
	echo "==================================================================================================================================="

	echo "1) utok"
	echo "2) obrana -> Zvysi tve stats pro crit utok v dalsim tahu"
	echo "3) Zjistit proc chce bojovat"
	echo "==================================================================================================================================="

	read akce

	if [ $akce = "1" ]; then
		criticalhit
		if [ $HPn -le 0 ]; then
			echo "[Alubmab]: Jeje toto boli auvajs, prosim zrychli, strasne me to boli"
			echo "[$jmeno]: Dostals co si zaslouzis ty spindiro"
			sleep 2
        	echo "(Alubmab zemrel)"
			break
		else
			echo "[Alubmab]: Ajo, to je vsechno co mas?!"
			echo "Alubmabovi zbyva "$HPn"HP"
			echo "(ted utoci nepritel)"
			echo "[Alubmab]: Ty mrdkii, dostanez!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			HP=$(($HP-$DMGn))
			if [ $HP -ge 1 ]; then
				echo "Zbyva ti $HP HP"
			else
				echo "GG WP, umrel si. priste neumirej"
			fi

		fi
	else
		echo " "
	fi

echo "To je velmi sigma"
read ajooo
