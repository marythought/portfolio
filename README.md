# Portfolio

[Mary Dickson Diaz portfolio](http://www.marydickson.info)

## Description

**Project Portfolio** This is a Rails app designed to showcase my work as a web developer. Features:

- Remote JavaScript on the project CRUD (for admin) and show (for visitors) actions.
- Responsive and accessible site design
- Rubocop linted and i18n/localization support ([try it in Spanish!](http://www.marydickson.info/about?locale=es))
- Action Storage / AWS S3 integration for project image storage
- Render resume as partial view from markdown file for easier updating
- Site Features! In addition to the usual 'about me' and portfolio items, this site features some lightweight examples of my tech experience/skills:
  - Interactive "commonplace book" link (React/Redux / Rails API)
  - Blog post previews (Vanilla JS / Wordpress API)
  - Top tech news links (Go API)

Since first launching this site I have upgraded it from Rails 4 to Rails 5.3.

## Deploying

- rails assets:clobber
- rails assets:precompile
- heroku run rails db:migrate (if migrations)
- git push heroku [$branch_name]:master

## TODOS

- Beef up Tests
  - [build a restful json api with rails 5 tutorial with rspec](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one)
- Add dev db seeds
- [set up heroku deploy script](https://mentalized.net/journal/2017/04/22/run-rails-migrations-on-heroku-deploy/)
- Add info about the Go API to that page (copy the ReadMe, basically)
- Finish and add React/Redux commonplace book feature
  - [free code camp rails with react tutorial](https://www.freecodecamp.org/news/how-to-create-a-rails-project-with-a-react-and-redux-front-end-8b01e17a1db/)
  - Explain what a [commonplace book is](https://en.wikipedia.org/wiki/Commonplace_book)
  - [clean up the data fetch](https://blog.logrocket.com/patterns-for-data-fetching-in-react-981ced7e5c56/)
  - clean up the formatting
  - clean up welcome page
  - Admin can add links, automatically published
  - Admin can add existing categories
  - Admin can add a new category
  - Add categories to display
  - Filter by categories
  - Guests can add links that are not published
  - Admin can see unpublished links in a pending section
- Add developer philosophy / guiding principals to about me
- connect to [LinkedIn API (?)](https://www.linkedin.com/developers/)
- Add email contact form
- Add comments to projects
- CI

## Author

- Mary Dickson [github](https://github.com/marythought)

## License

MIT/X11
