## Instruction : 
### Etape 1
Changer dans le fichier inventory.yaml l'ansible_host avec l'ip de votre serveur (sous ubuntu)

### Etape 2
Changer dans le fichier de confige ngnix : viporten_config 
server_name viporten.42.fr par l'ip de votre serveur

### Run 
```ansible-playbook -i inventory.yaml deploy.yaml```