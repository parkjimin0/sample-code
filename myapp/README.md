# README
Welcome to the Hive Center, a Rails app that handles the basic CRUD for hives and cells. You can start by going to the homepage and building out your own hive!

# Getting Started

## Development setup
1. Seed the database to fill up your hive center: `rake db:seed` 
2. Start to run the app: `rails server` and head to the hive center homepage/port :`localhost:3000`

## Authentificaion
All users can see all and individual hives and cells, however you need to sign in to create, edit, or remove a hive/cell. To do so:

- For Hives username: `user` password: `pass`
- For Cells username: `users` password: `pass`

## Testing
- Run Specs via `rails rspec`
