# Le besoin

## Le vocabulaire

Rien ici ne demande de connaître le crédit immobilier. Quatre mots suffisent.

- **Dossier** : le projet immobilier d'un client chez nous, de la simulation à l'offre de prêt.
- **Emprunteur** : une personne qui emprunte. Un dossier en compte un ou deux.
- **Pièce justificative** : un document que la banque exige pour étudier le dossier. Pièce
  d'identité, bulletin de salaire, avis d'imposition, compromis de vente.
- **Expert crédit** : l'employé Pretto qui suit le dossier et le monte avec les banques, depuis
  un back-office.

## Le problème

Avant d'envoyer un dossier aux banques, il faut le constituer : rassembler toutes les pièces
justificatives. C'est de loin l'étape la plus chronophage du parcours. C'est aussi celle qui
nous attache le client. Quelqu'un qui a commencé à déposer ses pièces chez nous a peu de
raisons d'aller voir ailleurs. On pousse donc fort pour que les clients aillent au bout, sans y
passer des heures et sans avoir à se demander en permanence où ils en sont.

La liste des pièces change d'un dossier à l'autre. Un salarié fournit ses trois derniers
bulletins de salaire, un indépendant ses deux derniers bilans. Certaines pièces sont demandées
à chaque emprunteur, chacun sa pièce d'identité. D'autres concernent le dossier entier, comme
le compromis de vente. Un investissement locatif en ajoute encore.

Quand une pièce arrive, l'expert la contrôle. Il la valide, ou il la refuse avec un motif :
illisible, périmée, incomplète. Le client doit alors la renvoyer. L'expert ajoute parfois une
note pour ses collègues, que le client n'a pas à lire. Et il arrive qu'une banque réclame une
pièce à laquelle personne n'avait pensé. L'expert doit pouvoir la demander au client sans qu'on
livre une nouvelle version de l'app.

## Ce qu'il faut concevoir

L'architecture de l'API GraphQL qui répond à ce besoin, pour ses deux consommateurs.

L'app client, pour que le client puisse :

- savoir en un coup d'œil ce qu'il lui reste à faire ;
- déposer ses pièces ;
- comprendre pourquoi une pièce a été refusée, et la remplacer.

Le back-office, pour que l'expert puisse :

- voir où en sont tous les dossiers qu'il suit et repérer ceux qui bloquent ;
- consulter les pièces d'un dossier, les valider ou les refuser avec un motif ;
- réclamer une pièce qui n'était pas prévue.

Le repo contient une base de données et un squelette d'API déjà câblés. Le schéma de données
est là pour l'exemple : il est sommaire et ne reflète pas fidèlement ce qu'on fait en vrai.
Rien ne t'oblige à le suivre.

## Les livrables

**`submission/SCHEMA.graphql`** : le schéma que tu proposes, en SDL (Schema Definition
Language, la syntaxe `type … { … }`), couvrant les deux consommateurs.

**`submission/ARCHITECTURE.md`**, 2 pages maximum :

- tes 3 à 5 décisions d'architecture, et pourquoi tu les as prises ;
- les trous que tu as trouvés dans le brief, et l'hypothèse retenue pour chacun ;
- ce que tu as laissé de côté.

**Une tranche qui tourne** : une query, celle qui alimente l'écran du client, et une mutation de
ton choix, avec leurs tests. On veut voir ton code tourner, pas un schéma entièrement
implémenté.

## Ce qu'on regarde

D'abord ta capacité à traduire un besoin métier en architecture d'API. L'architecture compte
plus que le volume de code. Un schéma incomplet mais argumenté vaut mieux qu'un schéma complet
subi.

Tout le câblage GraphQL est déjà fait. [`STARTER.md`](STARTER.md) te montre où sont les choses.

## Après

45 minutes ensemble : tu présentes ton architecture, on la challenge, et on regarde comment
elle évolue face à un besoin nouveau.

## L'IA

Utilise les outils que tu veux, IA comprise. C'est ce qu'on fait au quotidien. La restitution
porte sur tes décisions, donc sois capable de défendre chaque choix.
