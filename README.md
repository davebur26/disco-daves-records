# Disco Dave's Records
This application was written as part of my first project at CodeClan. 

It was full stack and used the following resources;
- Ruby 2.4.1
- Sinatra
- PostgreSQL database
- HTML/CSS

The application was written using restful routes and applied a MVC framework. 

The live site can be found at - https://discodavesrecords.herokuapp.com/

---

## Running the app in development
All commands should be run in the command line of the top level of the file structure.

1. Open psql.
  ```sh 
  psql 
  ```
2. Create database.
  ```
  CREATE DATABASE record_store;
  ```
3. Run SQL file. 
```
 psql -d record_store -f db/record-store.sql
```
4. Run the app.
```
ruby app.rb
```
---

## Brief
The owner of a record store wants an app which will help him keep on top of his store inventory. They do not want an app that customers will see, but they will use to check stock levels and see what he needs to order soon.

You should be able to add stock, which would have an Artist and Album as well as the quantity available.

### MVP:

- Create albums with the quantity that are in stock
- Create artists
- Show an inventory page listing albums and artists
- Show a stock level for the inventory items e.g. High/Medium/Low

### Possible Extensions:

- Add a buy and sell price to each stock item
- Calculate the possible markup on items and show on inventory page
- Add a genre to an Album
- Any other ideas you might come up with




