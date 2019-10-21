# Portfolio

[![CircleCI](https://circleci.com/gh/marythought/portfolio/tree/master.svg?style=svg)](https://circleci.com/gh/marythought/portfolio/tree/master)

[Mary Dickson Diaz portfolio](http://www.marydickson.info)

## Description

**Project Portfolio** This is a Rails app designed to showcase my work as a software engineer.

## Developing

- rails generate react:component [name]

## Deploying

- rails assets:clobber
- rails assets:precompile
- heroku run rails db:migrate (if migrations)
- heroku run rails console (if console needed)
- git push heroku [$branch_name]:master

## TODOS

- Integration tests
- Jest tests for React
- [set up heroku deploy script](https://mentalized.net/journal/2017/04/22/run-rails-migrations-on-heroku-deploy/)
- Finish and add React commonplace book feature
  - V3: Categories
    - Filter by categories
  - V4: Publishing
    - Guests can add links that are not published
    - Admin can see unpublished links in a pending section
    - admin can approve links

## Author

- Mary Dickson [github](https://github.com/marythought)

## License

MIT/X11
