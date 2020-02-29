Introduction et sommaire

Le but de ce projet est de grandement faciliter le travail des développeurs dans leur travail vis à vis d'un projet déjà existant spécifique.
Ce projet tournera sur un environnement Debian.
Afin que tout se déroule sans accrocs, veuillez suivre l'ordre du sommaire dans l'utilisation de ce wiki

Sommaire :

1. [Installation](https://github.com/WrongJuice/dockerfile_debian-panga/wiki/Installation)
2. [Gérer le conteneur](https://github.com/WrongJuice/dockerfile_debian-panga/wiki/G%C3%A9rer-le-conteneur)
3. [Commandes docker utiles](https://github.com/WrongJuice/dockerfile_debian-panga/wiki/Commandes-docker-utiles)
4. [Compiler du code Qt, et l'exécuter](https://github.com/WrongJuice/dockerfile_debian-panga/wiki/Compiler-du-code-Qt,-et-l'ex%C3%A9cuter)

***

# **INSTALLATION**

# Introduction :


***
# Étape 1 : Installation de Docker

Pour pouvoir profiter de ce projet, vous devrez utiliser Docker.
Veuillez vous référer à la documentation officiel en fonction de votre OS :

***

* Mac OS :
[Installation de Docker pour Mac (documentation officielle)](https://docs.docker.com/docker-for-mac/install/)
***
* Windows :
[Installation de Docker pour Windows (documentation officielle)](https://docs.docker.com/docker-for-windows/install/)
***
* Cent OS :
[Installation de Docker pour Cent OS (documentation officielle)](https://docs.docker.com/install/linux/docker-ce/centos/)
***
* Debian :
[Installation de Docker pour Debian (documentation officielle)](https://docs.docker.com/install/linux/docker-ce/debian/)
***
* Fedora :
[Installation de Docker pour Fedora (documentation officielle)](https://docs.docker.com/install/linux/docker-ce/fedora/)
***
* Ubuntu :
[Installation de Docker pour Ubuntu (documentation officielle)](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
***
# Étape 2 : Compilation de l'image

Tout d'abord, il faut récupérer le fichier **`Dockerfile`** [ici](https://github.com/WrongJuice/dockerfile_debian-panga/archive/master.zip).
Ensuite, il faut ouvrir un terminal et se placer à dans le répertoire où le fichier est stocké (le fichier ne doit pas être renommé et doit impérativement s'appeler `Dockerfile`, il est recommandé de placer ce fichier dans un répertoire vide).

Enfin, il faut exécuter la commande suivante :

`docker build -t debian-panga .`

où `debian-panga` sera le nom de l'image compilée.

# Étape 3 : Lancement du premier conteneur

Maintenant que l'image est compilée, il faut exécuter un conteneur associé à cette image, pour se faire il suffit de lancer la commande suivante :

`docker run -v '{chemin du répertoire partagé}:/home/' -it --name panga debian-panga`

où `{chemin du répertoire partagé}` sera un répertoire partagé entre votre machine et le futur conteneur qui sera en fait la racine de `/home/` pour celui-ci (il contiendra tous les projets).
**Ne fermez pas/quittez pas le conteneur pour la prochaine étape.**

# Étape 3 : Finalisation de l'installation (**impératif**)

Il faut tout d'abord récupérer toutes les ressources [ici](https://github.com/WrongJuice/ressources_debian-panga).

Placez le fichier `Panga.zip` et `install.sh` dans le dossier `{chemin du répertoire partagé}`.
Puis dans le terminal associé au conteneur lancé dans l'étape précédente, exécutez la commande suivante :

`/home/install`

Cela va compiler les librairies nécessaires pour l'existant, traiter les ressources du fichier _.zip_ et effectuer quelques ajustements.

***

# **GERER LE CONTENEUR**

# Comment gérer le conteneur (lancer et quitter)

## 1. Lancer le conteneur
Une fois **Docker lancé**, exécutez la commande suivante pour démarrer le conteneur :

`docker container start panga`

## 2. Lancer un shell du conteneur
Lorsque le conteneur est démarré, vous pouvez alors "vous placer dedans", pour avoir le shell **zsh** (avec _oh my zsh_ installé) lancez la commande suivante :

`docker exec -it panga zsh`

### Si vous souhaitez à tout prix un shell bash classique

`docker exec -it panga bash`

***
## 3. Quitter le bash
Pour cela, il vous suffit d'exécuter cette commande :

`exit`

## 4. Stopper le conteneur
Pour cela, il vous suffit d'exécuter cette commande :

`docker container stop panga`

***

# **COMMANDES DOCKER UTILES**

## Lister les images :

`docker image ls`
## Lister les conteneurs :

`docker container ls -a` OU `docker ps -a`
## Supprimer une image :

`docker image rm nomImage/idImage`
## Supprimer un conteneur :

`docker container stop nomConteneur/idConteneur` (si il n'est pas déjà arrêté)

puis

`docker container rm nomConteneur/idConteneur`

***

# **COMPILER DU CODE QT, ET L'EXÉCUTER**

## Pour compiler ce type de code, il convient de vous placer à la racine du dossier du projet, là où le fichier _.pro_ est localisé.
Ensuite exécuter la commande :

* `qmake fichier.pro`

Le/Les fichier(s) `Makefile` vont alors être construits.

***


## Afin de compiler il ne vous reste plus qu'à exécuter la commande :

* `make`

### Si le fichier `Makefile` sur lequel vous souhaitez vous baser ne porte pas le nom de "`Makefile`", exécutez alors :

* `make -f leNomDuMakefile`

### Si vous souhaitez récupérer le fichier issu de la compilation dans un autre répertoire que celui dans lequel se trouve le code, déplacez vous simplement dans cet autre répertoire et exécutez :

* `make -f chemin+leNomDuMakefile`

### Si vous souhaitez compiler depuis un autre répertoire, exécutez :

* `make -C chemin`

### Si vous souhaitez compiler depuis un autre répertoire en vous basant sur un `Makefile` qui ne porte pas le nom de "`Makefile`", exécutez :

* `make -C chemin -f leNomDuMakefile`
***
## Lancer le fichier compilé :
Après la compilation, un fichier du nom du projet est généré, il suffit alors de l'exécuter avec :

`./nomDuFichierGénéré`

Notez que vous pouvez toujours rendre ce fichier exécutable avec :

`chmod +x nomDuFichierGénéré`
