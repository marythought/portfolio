# Portfolio

[Mary Dickson Diaz portfolio](http://www.marydickson.info)

## Description

**Project Portfolio** This is a Rails app designed to showcase my work as a web developer. Features:

- Remote JavaScript on the project CRUD (for admin) and view (for visitors) actions.
- Integration with WordPress API for blog post previews
- Responsive and accessible site design

Since first launching this site I have upgraded it from Rails 4 to Rails 5.3, including adding Action Storage for uploadable project images.

## Deploying

- rails assets:clobber
- rails assets:precompile
- heroku run rails db:migrate (if migrations)
- git push heroku [$branch_name]:master

## TODOS

- Tests
- i18n strings
- [set up heroku deploy script](https://mentalized.net/journal/2017/04/22/run-rails-migrations-on-heroku-deploy/)
- Import resume as markdown from S3, enable edit and save for admin
- connect to [LinkedIn API (?)](https://www.linkedin.com/developers/)
- Add email contact form
- Add comments to projects
- Add React/Redux calendar

## Author

- Mary Dickson [github](https://github.com/marythought)

## License

MIT/X11
