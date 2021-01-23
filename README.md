# README
## NOTE
This project involves calculation of variance based on various temperature values over last minute using Rails API based project.

## Technology stack
Ruby 2.5
Ruby on Rails 5.2.4
PostgreSQL 10
Grape API
Grape Swagger
Rubocop

## Requirements
Before you get started, the following needs to be installed:

Ruby. Version >=2.5.3 
RubyGems
Bundler: gem install bundler
Git
PostgreSQL >=9.5

## Setting up the development environment
- Copy `database.example.yml` content into `database.yml` and change database credentials as per your environment
- Create database: `rake db:create`
- Run migration database: `rake db:migrate`
- Seed token value: `rake db:seed`
- Start server: `rails s`

## REST API Endpoints

### Add New dataset

To add a new dataset, POST JSON to `/datasets`:

A full example with `curl` is:

```
curl -H "X-Authentication-Token: POmVgiXBJ9JyrIUIwuqDQA" \
-d "dataset[temperature]=234.12&dataset[recorded_at]=2021-01-23T10:44:34" \
-X POST http://localhost:3000/v1/datasets
# dataset created with temperature and recorded_at value
```
### Get a dataset value

A full example with `curl` is:

```
curl -H "X-Authentication-Token: POmVgiXBJ9JyrIUIwuqDQA" \
-X GET http://localhost:3000/v1/datasets/1
```

### Update a dataset value

A full example with `curl` is:

```
curl -H "X-Authentication-Token: POmVgiXBJ9JyrIUIwuqDQA" \
-d "dataset[temperature]=239.12" \
-X PUT http://localhost:3000/v1/datasets/1
```

### Get Variance

A full example with `curl` is:

```
curl -H "X-Authentication-Token: POmVgiXBJ9JyrIUIwuqDQA" \
-X GET http://localhost:3000/v1/datasets/variance
```



# SQL Database Schema


## Datasets
```
create_table "datasets", force: :cascade do |t|
    t.decimal "temperature", precision: 5, scale: 2
    t.datetime "recorded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
```

## Tokens
```
create_table "tokens", force: :cascade do |t|
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_tokens_on_auth_token"
  end
```

