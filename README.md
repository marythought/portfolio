# Portfolio

[Mary Dickson Diaz portfolio](http://www.marydickson.info)

## Description

**Project Portfolio** This is a Rails app designed to showcase my work as a web developer. Features:

- Remote JavaScript on the project CRUD (for admin) and show (for visitors) actions.
- Integration with WordPress API for blog post previews
- Responsive and accessible site design
- Rubocop linted and i18n/localization support ([try it in Spanish!](http://www.marydickson.info/about?locale=es))
- Action Storage / AWS S3 integration for project image storage
- Render resume as partial view from markdown file for easier updating

Since first launching this site I have upgraded it from Rails 4 to Rails 5.3.

## Deploying

- rails assets:clobber
- rails assets:precompile
- heroku run rails db:migrate (if migrations)
- git push heroku [$branch_name]:master

## TODOS

- CI
- Tests
  - https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
- [set up heroku deploy script](https://mentalized.net/journal/2017/04/22/run-rails-migrations-on-heroku-deploy/)
- connect to [LinkedIn API (?)](https://www.linkedin.com/developers/)
- Add email contact form
- Add comments to projects
- Finish and add React/Redux calendar
  - https://www.freecodecamp.org/news/how-to-create-a-rails-project-with-a-react-and-redux-front-end-8b01e17a1db/
- Add developer philosophy / guiding principals to about me

## Author

- Mary Dickson [github](https://github.com/marythought)

## License

MIT/X11
