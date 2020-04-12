# pgMasKING🤴

[![build](https://github.com/kibitan/pgmasking/workflows/build/badge.svg?branch=master)](https://github.com/kibitan/pgmasking/actions?query=workflow%3Abuild+branch%3Amaster)
[![Maintainability](https://api.codeclimate.com/v1/badges/290b3005ecc193a3d138/maintainability)](https://codeclimate.com/github/kibitan/masking/maintainability)

[![codecov](https://codecov.io/gh/kibitan/pgmasking/branch/master/graph/badge.svg)](https://codecov.io/gh/kibitan/pgmasking)

*This project is currently Work in Progress*

The command line tool for anonymizing PostgreSQL database records by parsing a SQL dump file and build a new SQL dump file with masking sensitive/credential data.

for MySQL: [MasKING](https://github.com/kibitan/masking)

## Installation

```bash
(TBC)
```

## Requirement for development

* Golang 1.14

## Supported RDBMS

* PostgreSQL: version (TBC)

## Usage

1. Setup configuration for anonymizing target tables/columns to `pgmasking.yml`

    ```yaml
      # table_name:
      #   column_name: masked_value

      users:
        string: anonymized string
        email: anonymized+%{n}@example.com # %{n} will be replaced with sequential number
        integer: 12345
        float: 123.45
        boolean: true
        null_column: null
        date: 2018-08-24
        time: 2018-08-24 15:54:06
        binary_or_blob: !binary | # Binary Data Language-Independent Type for YAML™ Version 1.1: http://yaml.org/type/binary.html
          R0lGODlhDAAMAIQAAP//9/X17unp5WZmZgAAAOfn515eXvPz7Y6OjuDg4J+fn5
          OTk6enp56enmlpaWNjY6Ojo4SEhP/++f/++f/++f/++f/++f/++f/++f/++f/+
          +f/++f/++f/++f/++f/++SH+Dk1hZGUgd2l0aCBHSU1QACwAAAAADAAMAAAFLC
          AgjoEwnuNAFOhpEMTRiggcz4BNJHrv/zCFcLiwMWYNG84BwwEeECcgggoBADs=
    ```

    A value will be implicitly converted to a compatible type. If you prefer to explicitly convert, you could use a tag as defined in [YAML Version 1.1](http://yaml.org/spec/current.html#id2503753)

    ```yaml
      not-date: !!str 2002-04-28
    ```

    *NOTE: pgMasKING doesn't check actual schema's type from the dump. If you put incompatible value it will cause an error during restoring to the database.*

1. Dump database with anonymizing

    TBC

    ```bash
      pg_dump DATABASE_NAME | pgmasking > anonymized_dump.sql
    ```

1. Restore from the anonymized dump file

    TBC

    ```bash
      psql ANONYMIZED_DATABASE_NAME < anonymized_dump.sql
    ```

    Tip: If you don't need to have an anonymized dump file, you can directly insert it from the stream. It can be faster because it has less IO interaction.

      ```bash
        pg_dump DATABASE_NAME | pgmasking | psql ANONYMIZED_DATABASE_NAME
      ```

### options

(WIP)

```bash
$ pgmasking -h
Usage: pgmasking [options]
    -c, --config=FILE_PATH           specify config file. default: pgmasking.yml
    -v, --version                    version
```

## Use case of anonymized (production) database

[Read here](https://github.com/kibitan/masking#use-case-of-anonymized-production-database)

## Development

```bash
git clone git@github.com:kibitan/pgmasking.git
```

### boot

```bash
  go run .
```

or

```bash
  go build .
  ./pgmasking
```

or

```bash
  go install .
  pgmasking
```

### Run test

```bash
  go test -race -v ./...
```

### Lint

```bash
  golint ./... && go vet ./...
```

#### acceptance test

(TBC)

##### with docker

(TBC)

## Development with Docker

```bash
docker build . -t pgmasking
echo "sample stdout" | docker run -i pgmasking
docker run pgmasking -v
```

## Profiling

(TBC)

### Benchmark

(TBC)

## Design Concept

[Read here](https://github.com/kibitan/masking#design-concept)

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/kibitan/pgmasking](https://github.com/kibitan/pgmasking).
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the pgMasKING project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kibitan/masking/blob/master/CODE_OF_CONDUCT.md).
