## Resume du project :
### Deployement autommatique d'une application
L'objectif de ce project est d'automatiser le lancement d'une application dans un serveur cloud.
Pour cela nous utiliserons ***ansible*** pour donner les instructions necessaire pour a la fois communiquer avec le serveur, y installer les dependances, puis lancer les dockers sur le serveur distant. 
### Une application
L'application que nous devons deployer est un wordpress relie a une db et a un phpmyadmin.
Certaines precautions sont a prendre, un minimun de securite est demande. Les variables doivent etre dans un fichier ```.env```. Aucun acces externieur de dois pouvoir se connecter a la base de donnee.
J'ai rajoute, un reverse proxy pour eviter toutes communication direct avec les containeur et rajouter un certificat ssl au passage avec traefik et let's encrytpon.
Chaque service a son containeur.

## Instruction de lancement: 
### Etape 1 : le serveur
Pour le serveur j'utilise google cloud platforme qui me permet de creer une vm et ouvrant les port http et https et de lui donner une clef ssh assez facilement.
Changer dans le fichier ```production``` l'ansible_host avec l'ip de votre serveur (sous ubuntu).
Mettre a jour votre ip sur Duckdns.org pour faciliter l'utilisation de let's Encrypt sinon changez la variable d'environnement du containeur traefik dans ```roles/common/App/compose```
Changer l'email du certificate dans le fichier ```roles/common/App/traefik/traefik.yml```

### Etape 2 : Run 
```ansible-playbook -i production site.yml -e "local_user=$(whoami)"```
une fois les containeurs lance, utilisez les url : ``` https://wpvp.{Domain} et http://phpmyadminvp.{Domain}``` pour vous connecter a votre wordpress et votre phpmyadmin.
Vous pouvez changer le nom des routes qui vous redirigerons vers vos containeur dans le fichier compose dans ```roles/common/App```
