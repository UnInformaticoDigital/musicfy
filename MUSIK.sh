
# Script that automates the installation of youtube-dl,
# Not responsible of any problems copyright related, in any case,
# check for youtube-dl policy

clear

banner () {

	echo '
		 _______           _______ _________ _       
		(       )|\     /|(  ____ \\__   __/| \    /\
		| () () || )   ( || (    \/   ) (   |  \  / /
		| || || || |   | || (_____    | |   |  (_/ / 
		| |(_)| || |   | |(_____  )   | |   |   _ (  
		| |   | || |   | |      ) |   | |   |  ( \ \ 
		| )   ( || (___) |/\____) |___) (___|  /  \ \
		|/     \|(_______)\_______)\_______/|_/    \/
                                             
	
'
	echo "  ________________________________________________________________________"
	echo ""
	echo "	  Y  O  U  T  U  B  E - D  L	  A  U  T  O  M  A  T  I  O  N	"	
	echo ""
	echo "			U N  I N F O R M A T I C O  D I G I T A L"
	echo "  ________________________________________________________________________"

}

menu () {
	
	echo ""
	echo "		1) INSTALL REQUIREMENTS"
	echo ""
	echo "		2) DOWNLOAD MUSIC"
	echo ""
	echo "		3) EXIT"
	read ch
	case $ch in
		1)requirements;;
		2)downloadMusic;;
		3)exit 0;;
		*) echo "INVALID OPTION"
	esac

}

start() {
	
	banner
	menu
}

requirements(){

	sudo apt update && sudo apt install ffmpeg wget	python-pip
	sudo pip install youtube-dl
	echo ""
	echo "		Youtube-dl version `youtube-dl --version` succesfully installed"
	echo ""
	echo " -- PRESS ANY KEY TO CONTINUE -- "
	read any
	clear
	start
}

downonesong(){
	echo "		Z) Volver al ménu"
	echo "		LINK)Introduce el link"
	read link
	if [ "$link" = "Z" ]
	then
		downloadMusic
	else	
		echo $link
		youtube-dl -x --embed-thumbnail --audio-format mp3 $link
	fi
}

downplaylist(){
	echo "		Z) Volver al ménu"
	echo "		LINK) Introduce el link de la playlist"
	read link
	if [ "$link" = "Z" ]
	then	
	echo "$link"
		downloadMusic
	else
		echo "$link"
		youtube-dl -x -c -i -t --embed-thumbnail --audio-format mp3 --yes-playlist $link
	
	fi
}

downprofile(){
	echo "		Z) Volver al ménu"
	echo "		LINK) Introduce el link del canal"
	read link
	if [ "$link" = "Z" ]
	then
		downloadMusic
	else	
		echo "$link"
		youtube-dl -x -c -i -t --embed-thumbnail --audio-format mp3 $link 
	fi
}

looping() {
	echo "		Z) Volver al ménu"
	echo "		LINK)Introduce el nombre del fichero"
	read file
	if [ "$file" = "Z" ]
	then
		downloadMusic
	else
		i=1
		while read line; do
			echo "Line No. $i : $line"
			echo "Downloading link No. $i :  $line"
		
			i=$((i+1))
		done < $file
	
	fi
}

coffee() {
			echo "	-----------------------------------------------------"
			echo ""
			echo "		S T A R T I N G  T H E  E N G I N E "
			echo " "
			echo "		   G O  T A K E  A  C O F F E E"
			echo "		    This is gonna take a while"
			echo ""
	
}

bunchOfsongs() {
	echo "		Z) Volver al ménu"
	echo "		FNAME)Introduce el nombre del fichero"
	read file
	if [ "$file" = "Z" ]
	then 	
		downloadMusic
	else
		
		i=1
		while read line; do
			if [ $i -eq 1 ]
			then	
				coffee
				echo "	-----------------------------------------------------"
				echo "	Starting downloads from file."
				echo "	Song No. $n "
				echo "	URL:$line"
				echo ""
			else
				echo "	-----------------------------------------------------"
				echo "	Downloading from file."
				echo "	Song No. $i "
				echo "	URL:$line"
				echo ""
			fi
			youtube-dl -x --embed-thumbnail --audio-format mp3 $line 
			echo ""
			echo "	Going to the next link !"
			echo "	_____________________________________________________"
			i=$((i+1))
		done < $file

	fi	
}

bunchOfplaylists(){
	echo "		Z) Volver al ménu"
	echo "		FNAME)Introduce el nombre del fichero"
	read file
	if [ "$file" = "Z" ]
	then 
		downloadMusic
	else
		i=1
		while read line; do
			if [ $i -eq 1 ]
			then	
				coffee
				echo "	-----------------------------------------------------"
				echo "	Starting downloads from file."
				echo "	Song No. $i"
				echo "	URL:$line"
				echo ""
			else
				echo "	-----------------------------------------------------"
				echo "	Downloading from file."
				echo "	Song No. $i "
				echo "	URL:$line"
				echo ""
			fi
			youtube-dl -x -c -i -t --embed-thumbnail --audio-format mp3 --yes-playlist $line 
			echo ""
			echo "	Going to the next link !"
			echo "	_____________________________________________________"
			i=$((i+1))
		done < $file
	fi
}

bunchOfchannels(){
	echo "		Z) Volver al ménu"
	echo "		FNAME)Introduce el nombre del fichero"
	read file
	if [ "$file" = "Z" ]
	then 
		downloadMusic
	else
		i=1
		while read line; do
		# Read each line
			if [ $i -eq 1 ]
			then	
				coffee
				echo "	-----------------------------------------------------"
				echo "	Starting downloads from file."
				echo "	Song No. $n "
				echo "	URL:$line"
				echo ""
			else
				echo "	-----------------------------------------------------"
				echo "	Downloading from file."
				echo "	Song No. $i "
				echo "	URL:$line"
				echo ""
			fi
			youtube-dl -x -c -i -t --embed-thumbnail --audio-format mp3 "$line" 
			echo ""
			echo "	Going to the next channel link !"
			echo "	_____________________________________________________"
			i=$((i+1))
		done < $file
	fi
}

bunchOfprofiles() {
	echo "		Z) Volver al ménu"
	echo "		FNAME)Introduce el nombre del fichero"
	read file
	if [ "$file" = "Z" ]
	then 	
		downloadMusic
	else
		
		i=1
		while read line; do
			if [ $i -eq 1 ]
			then	
				coffee
				echo "	-----------------------------------------------------"
				echo "	Starting downloads from file."
				echo "	Song No. $n "
				echo "	URL:$line"
				echo ""
			else
				echo "	-----------------------------------------------------"
				echo "	Downloading from file."
				echo "	Song No. $i "
				echo "	URL:$line"
				echo ""
			fi
			youtube-dl -x -c -i -t --embed-thumbnail --audio-format mp3 $line 
			echo ""
			echo "	Going to the next link !"
			echo "	_____________________________________________________"
			i=$((i+1))
		done < $file

	fi	
}

downloadMusic(){
	clear
	banner
	echo ""
    echo " 		         WHAT DO YOU WANT TO DO ? "
    echo " 		 _____________________________________"
    echo ""
	echo "		1) Download one song"
    echo ""
    echo "		2) Download from playlist"
    echo ""
    echo "		3) Download from profile"
    echo ""
    echo "		4) Download from file [NEW]"
	echo ""
	echo "		5) Exit"
	echo " 		 _____________________________________"
        echo ""
		read ch2
        

        case $ch2 in
                1)downonesong;;
                2)downplaylist;;
				3)downprofile;;
				4)downloadLooping;;
                5)exit 0;;
                
		*) echo "INVALID OPTION"
        esac
}


downloadLooping(){
	echo "			SELECT TYPE OF LINKS ? "
	echo "		_____________________________________"
	echo ""
	echo "			1) Bunch of individual songs"
	echo ""
	echo "			2) Bunch of playlist"
	echo ""
	echo "			3) Bunch of profile"
	echo ""
	echo "			4) Exit"
	echo "		_____________________________________"
	read ch3
	echo "||"

	case $ch3 in
		1)bunchOfsongs;;
		2)bunchOfplaylist;;
		3)bunchOfprofiles;;
		4)exit 0;;
		*) echo "INVALID OPTION"
	esac
}


n="0"
while [	$n -lt	99 ]
do
	n=$(($n + 1 ))
	start
done






