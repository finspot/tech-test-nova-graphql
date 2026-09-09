# Le starter

Une app Rails 8 API-only, avec `graphql-ruby`, RSpec et PostgreSQL, comme nova-api. Elle existe
pour que tes 2 heures aillent à l'architecture de l'API et pas à l'installation.

Les commandes de démarrage sont dans le [README](README.md).

## Ce que le starter ne décide pas

Il câble GraphQL, l'accès à la base et l'authentification. Il ne décide rien de l'architecture
interne. Où vit la logique métier, comment tu représentes une erreur métier, comment tu
structures tes types : ce sont tes décisions, et elles font partie de ce qu'on regarde.

Les deux exemples fournis, `whoami` et `echo`, ne touchent pas au domaine du dossier. Ils
montrent la mécanique, rien de plus. Supprime-les dès que tu n'en as plus besoin.

## Qui appelle l'API

L'authentification est simulée. En vrai, l'API reconstruit l'appelant depuis un cookie. Ici tu
choisis ton rôle avec des en-têtes HTTP.

```sh
make server   # bundle exec rails server

curl -s localhost:3000/graphql \
  -H 'Content-Type: application/json' \
  -H 'X-Role: client' \
  -H 'X-Project-Id: 1' \
  -d '{"query":"{ whoami { role } }"}'
```

`X-Role` vaut `client` ou `advisor`, `X-Project-Id` est l'id du dossier. Sans en-tête,
l'appelant est anonyme, ce qui permet de vérifier tes autorisations.

Dans les tests, le contexte se passe directement :

```ruby
context = { viewer: Viewer.new(role: :client, project_id: project.id, mortgagor_id: nil) }
NovaGQL::Schema.execute(query, context:)
```

## Ce qui est déjà là

```
app/graphql/nova_gql/
├── schema.rb        # rescue_from, unauthorized_*
├── query.rb         # racine Query
├── mutation.rb      # racine Mutation
├── base/            # Object, Query, Mutation, ProtectedObject, ProtectedField
├── error/           # erreurs techniques remontées en erreurs GraphQL
├── types/
├── queries/whoami.rb              # exemple de câblage
└── mutations/echo.rb              # exemple de câblage
```

`whoami` et `echo` sont là pour être supprimées. Elles ne modélisent rien : elles montrent
comment on déclare une query, une mutation, un input et un payload, et comment on lit
l'appelant. Leurs specs, dans `spec/graphql/nova_gql/`, montrent comment on teste ici.

Deux conventions à garder :

- Les champs sont authentifiés par défaut. `enforceable: false` sur un champ racine ouvre
  l'accès aux anonymes, comme `ping`.
- Les mutations ne sont pas des Relay mutations : un `argument :input, Types::Input::XInput` et
  un `type Types::Payload::XPayload, null: false`.

Dans un resolver ou une mutation, `viewer` te donne l'appelant, et `project` le dossier auquel
il est rattaché, chargé une seule fois par requête. Voir `base/query.rb`.

Le code et les commentaires sont en anglais. Chaque fichier commence par
`# frozen_string_literal: true`.

## Le schéma de données

`db/migrate/` contient un schéma d'exemple, volontairement sommaire. Il ne reflète pas
fidèlement ce qu'on fait en vrai.

Tu peux ajouter une migration si tu le juges utile. Dis dans ton `ARCHITECTURE.md` ce que tu as
changé et pourquoi.

`make seed` recharge des données qui couvrent les cas tordus : un couple dont l'un est
indépendant, une pièce refusée. Le seed vide les tables avant d'écrire, tu peux le relancer
autant de fois que tu veux. `make console` ouvre une console Rails pour aller les regarder.

## Le schéma GraphQL est versionné

`schema.graphql` est généré, pas édité à la main. C'est le schéma servi par le code, à ne pas
confondre avec ton `submission/SCHEMA.graphql`. Après une modification dans `app/graphql` :

```sh
make schema   # bundle exec rake graphql:schema_dump
```

Un test échoue si tu l'oublies. C'est le même garde-fou qu'en CI chez nous.
