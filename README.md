# Test technique : Senior Backend Engineer (Nova)

## Pourquoi ce sujet

Nova, c'est le Pretto grand public. L'app où nos clients montent leur dossier de prêt, et les
outils que nos experts crédit utilisent pour les accompagner. Une seule équipe backend expose
les APIs des deux côtés, et le poste consiste à en être propriétaire.

Le sujet de ce test est un chantier réel chez nous. Constituer un dossier prend des semaines,
mobilise le client et son expert, et personne n'est satisfait de l'API actuelle. C'est le genre
de sujet que tu prendrais en main.

Ce qu'on veut voir : comment tu traduis ce besoin en architecture d'API. Pas si tu connais
`graphql-ruby` par cœur.

## Durée

2 heures, pas plus. On préfère un périmètre réduit et des choix argumentés à une copie
exhaustive. Dis ce que tu n'as pas fait.

## Par où commencer

1. [`BRIEF.md`](BRIEF.md) : le besoin métier et les livrables. Commence ici.
2. [`STARTER.md`](STARTER.md) : comment le code est câblé et ce qui est déjà là.

## Prérequis

- **Ruby**, dans la version de [`.ruby-version`](.ruby-version).
- **Docker**, pour le PostgreSQL du `docker-compose.yml` : [Docker Desktop](https://docs.docker.com/desktop/)
  sur macOS, [Docker Engine](https://docs.docker.com/engine/install/) sur Linux. Si tu as déjà
  un PostgreSQL, tu peux t'en passer, voir plus bas.
- **`make`**, pour les raccourcis. Il est déjà là sur presque toutes les machines,
  `make --version` te le dira.

Si `make` te manque :

| Système | Installation |
|---|---|
| macOS | `xcode-select --install` (les Command Line Tools l'embarquent), ou `brew install make` |
| Debian, Ubuntu | `sudo apt install build-essential` |
| Fedora | `sudo dnf install make` |
| Arch | `sudo pacman -S make` |

C'est du [GNU Make](https://www.gnu.org/software/make/) standard, sans extension exotique. Et il
n'est pas obligatoire : chaque cible du `Makefile` est une commande que tu peux taper à la main.

## Démarrer

Il te faut un PostgreSQL. Si tu n'en as pas sous la main, celui du `docker-compose.yml` fait
l'affaire.

```sh
make setup
make test
```

Cinq exemples doivent passer. Si c'est vert, tu es prêt. `make` tout seul liste le reste :
`make server`, `make console`, `make seed`.

Le `Makefile` n'est qu'un raccourci. À la main, c'est :

```sh
docker compose up -d --wait
bundle install
bundle exec rake db:prepare
bundle exec rspec
```

Le compose écoute sur le port **5433** et pas 5432, pour ne pas entrer en conflit avec un
PostgreSQL que tu ferais déjà tourner. La config par défaut pointe dessus, tu n'as rien à faire.

Si 5433 est occupé chez toi aussi, `DATABASE_PORT` déplace le conteneur et Rails d'un coup :

```sh
DATABASE_PORT=5434 make setup
```

Si tu préfères utiliser ton PostgreSQL, saute `make up` et exporte `DATABASE_PORT`
(`5432` en général), plus `DATABASE_HOST`, `DATABASE_USERNAME` et `DATABASE_PASSWORD` si besoin.
`DATABASE_URL` fonctionne aussi.

## Ce que tu rends

| Livrable | Où |
|---|---|
| Le schéma GraphQL que tu proposes, en SDL | `submission/SCHEMA.graphql` |
| Tes décisions d'architecture, 2 pages max | `submission/ARCHITECTURE.md` |
| Une query et une mutation qui tournent, avec leurs tests | `app/graphql/` et `spec/` |

Quand tu as fini, pousse sur ce repo et préviens-nous.

## Une question ?

Le brief a des trous, c'est normal. Note tes questions dans `submission/ARCHITECTURE.md`, avec
l'hypothèse que tu as prise pour avancer.

Si c'est le starter qui coince, une commande qui échoue ou un test rouge au premier lancement,
écris-nous directement.
