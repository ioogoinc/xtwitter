# XWITTER-CLONE
In this project you will find all implementations requested from different practices
throughout the training program, as the time goes, the README.md will be updated
with new instructions for new features.

## Getting started
First we will need the following requirements.
- Ruby 3.1.2^
- PostgreSQL 12.16^

Once you met the requirements you need to clone this repository using

`git clone`

Once the project has been cloned run.

```
bundle install
```

## Current Stage
At the moment we will have only migrations, models and its relationships on the database set up as well as in the models logic.

To run the migrations you will need to configure your own  `database.yml`  file and then run the following commands.

```
rails db:create
rails db:migrate
```

This should create you a schema file from which you will be getting information when you do `db:migrate:status`
