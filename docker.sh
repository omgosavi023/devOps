!/bin/bash

echo "perform docker login before this script [cmd : Docker login]"

echo "Enter image name you want to create"
printf "1.Python \n2.Java \n3.C \n4.SQL \n5.BASH\n"
read img


function python() { 
echo "Provide a directory name"
read dt
mkdir $dt
cd $dt
pwd
echo "print ('Hello')" > hello.py
echo "
FROM python:3.9-slim-buster
WORKDIR /app
COPY hello.py .
CMD [\"python\",\"hello.py\"]
" > Dockerfile
echo "give name of image"
read imgname
clear
echo "creating image... "
sudo docker build -t $imgname .
#echo "to run enter [docker run -dit <imagename>]"
sudo docker run -it $imgname
echo "exit..."
}


case "$img" in

	1)
		echo "python"
		python
		;;
	2)	
		echo "Java"
		;;
	3)
		echo "C"
		;;
	4) 
		echo "SQL"
		;;
	5)
		echo "BASH"
		;;
	*)
		echo "default"
		;;
esac

