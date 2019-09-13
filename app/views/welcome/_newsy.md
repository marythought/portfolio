# Newsy App

This is a [RESTful Go API](https://github.com/marythought/newsy) that returns top news articles from several tech news sources. It uses a MongoDB database store and currently supports three endpoints:

- [Crawl](https://newsy-bits.herokuapp.com/crawl): Calls news source APIs and saves articles in MongoDB database, returns a count of number of articles added to DB
- [News](https://newsy-bits.herokuapp.com/news): Gets all top news stories saved in the MongoDB database and return articles as JSON in decending date order
- [Clean](https://newsy-bits.herokuapp.com/clean): Removes entries from DB 30+ days old, returns a count of number of articles deleted
