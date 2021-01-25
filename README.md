# sdtd-cassandra

### Description 
- `Cassandra.yaml` contient la configuration de notre cluster Cassandra (surtout en ce qui concerne les adresses IP, les seed_providers, les lectures concurrentes etc...).

- `Dockerfile` contient les éléments nécessaires pour la création d'une image contenant les éléments nécessaires pour le bon fonctionnement du cluster Cassandra.

- `init_cassandra.cql` permet d'automatiser la création du `keyspace` et des deux tables utilisées dans notre application `crimes` et `crimes_prediction` qui contiendra les enregistrements générés par le traitement Spark.

- `startup_script.sh` exécute le cluster Cassandra et initialise les tables grâce au fichier précédent.
