#Image de base : STEP 1
FROM debian

#Qui maintient le dockerfile
MAINTAINER pts3

#Commande à lancer -> update des packages systèmes
RUN apt-get update

#Commande à lancer -> installation de quelques programmes nécessaires et d'autres pour le confort
RUN apt-get install apt-utils -y
RUN apt-get install python-pip -y
RUN apt-get install -y nano
RUN apt-get install -y curl
RUN apt-get install -y unzip
RUN apt-get install -y zsh
RUN apt-get install -y wget
RUN apt-get install -y git
RUN chsh -s $(which zsh)
RUN yes | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN wget -O ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

# Définition des locale
RUN apt-get install -y locales
RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && locale-gen --no-purge fr_FR.UTF-8
ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr
ENV LC_ALL fr_FR.UTF-8

#Commande à lancer -> installation des librairies pour le parsing de pdf
RUN apt-get install tesseract-ocr -y
RUN apt-get install libtesseract-dev -y
RUN apt-get install tesseract-ocr-fra
RUN apt-get install imagemagick -y
RUN apt-get install libmagick++-dev -y
RUN apt-get install magick++-dev -y

#Commande à lancer -> installation des librairies pour qt
RUN apt-get install build-essential -y
RUN apt-get install qtcreator -y
RUN apt-get install qt5-default -y
RUN apt-get install qt5-doc qtbase5-examples qtbase5-doc-html -y

#Commande à lancer -> installation du dépôt de Panga
RUN echo "deb http://deb.panga.fr/buster panga-common-staging main" >> /etc/apt/sources.list
RUN wget http://deb.panga.fr/public.key
RUN apt-key add public.key
RUN rm public.key
RUN apt-get update

#Commande à lancer -> installation des lib pour l'existant
RUN apt-get install mosquitto -y
RUN apt-get install libmosquitto-dev -y
RUN apt-get install libmosquittopp-dev -y
RUN apt-get install libssh-dev -y
RUN apt-get install qt5-panga-dev -y
RUN apt-get install libhasimov -y
RUN apt-get install libprotobuf-dev -y
RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.7.0/protoc-3.7.0-linux-x86_64.zip
RUN unzip -o protoc-3.7.0-linux-x86_64.zip -d /usr/local bin/protoc
RUN unzip -o protoc-3.7.0-linux-x86_64.zip -d /usr/local 'include/*'
RUN rm -f protoc-3.7.0-linux-x86_64.zip
RUN apt-get autoremove -y

#Pour lancer l'image faire : docker run -v '{chemin des projets sur votre machine}:/home/' -it --name panga debian-panga
#Exemple : docker run -v '/Users/alfred/Documents/DUT/PTS3/Panga/:/home/' -it --name panga debian-panga