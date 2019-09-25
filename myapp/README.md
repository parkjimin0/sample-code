# README
Welcome to the Hive Center, a Rails app that handles the basic CRUD for hives and cells. You can start by going to the homepage and building out your own hive!

A CRUD APP that also is versatile to JSON API that allows you to CRUD beehives and cells. The current database set up uses PostgreSQL and has seeded data all ready for you to begin. Each hive can have an unlimited amount of cells, but it starts with 5 hives and 6 cells in each once the data has been seeded. Each cell has a name and a cell type. Welcome to the hive center!

# Getting Started

## Development setup
1. Seed the database to fill up your hive center: `rake db:seed` 
2. Start to run the app: `rails server` and head to the hive center homepage/port :`localhost:3000`
3. To view the JSON APIs: 
    - For hives: 
        - To view individual hive and cumulative cells by type: `localhost:3000/beehives/:id.json`
    - For cells: 
        - To view any individual cell: `localhost:3000/cell/:id`
        - To update a cell: (a put request to)`localhost:3000/beehives/6/cells/35/edit`


## Authentificaion
All users can see all and individual hives and cells, however you need to sign in to create, edit, or remove a hive/cell. To do so:

- For Hives username: `user` password: `pass`
- For Cells username: `cell` password: `pass`

## Testing
- Run Specs via `bundle exec rspec`

## Side Note to Developers
Set up instructions have been laid out, but don't forget to connect to postgreSQL first by rake db:setup and bundle install before starting the rails server. Also, if your yarn is out-of-date: yarn install --check-files.
