# Hasura

## Table of contents

- [Installation](#installation)
    - [Required software](#required-software)
- [Usage](#usage)
    - [Start hasura](#start-hasura)
    - [Commands](#commands)
- [Useful links](#useful-links)

## Installation

The following instructions will walk you through the process of setting up and deploying project on your local machine.

### Required software

- [Hasura cli](https://hasura.io/docs/latest/graphql/core/hasura-cli/install-hasura-cli.html)
- [Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/) (*optional)

## Usage

### Start hasura

All hasura data are located at [hasura folder](hasura), local docker-compose located [this](ci/dev) or [this](ci/dev:m1) for Mac-m1.

First you must start hasura and pg by `make up` (or `make up-m1`). This command will run hasura in host network mode and postgres, which will be available at `localhost:5439`.

Once you've done that, update hasura state via:

- `make hasura-update`

After that hasura will be available at `localhost:8080`.

### Commands

This section will show main make commands. For a full command list you can use `make help`.

| Command                | Description                                 |
| ---------------------- | ------------------------------------------- |
| `make up`              | Up hasura in docker                         |
| `make up-m1`           | Up hasura in docker for mac-m1              |
| `make hasura-update`   | Update hasura state (migrations + metadata) |
| `make metadata-export` | Export local hasura metadata to yamls       |


## Useful links

- [Hasura docs](https://hasura.io/docs/latest/graphql/core/index.html)

---

## Создание миграций в Hasura

## Создаем файл миграции командой:
```shell
make migration-create name=migration_name
```

Создаются файлы up/down в директории *hasura/migrations/default/*

### Написание миграций

Пишем миграции только руками, не пользуемся встроенными генераторами миграций в hasura console - с ней могут быть проблемы, она не может корректно перекидывать индексы, строить down миграции и прочее.

## Мета-данные и права доступа

Не забываем про экспорт мета-данных, которые необходимы для мапинга таблиц в hasura. На нужные таблицы добавляем необходимые права доступа для user/anonymous на insert/select/update/delete. Далее экспортируем мета-данные командой:
```shell
make metadata-export
```

Полученные sql и yaml отгружаем в репозиторий.