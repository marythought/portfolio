import React from 'react';

const Home = () => (
  <div className="large-8 columns bottom-margin">
    <h1>Welcome</h1>
    <p>
      This site is built primarily in Ruby on Rails and is designed to showcase my skills as a full-stack software engineer. It is ever-evolving, but currently features the following:
    </p>
    <ul>
      <li>
        Remote JavaScript, React (front-end); Rails and Go APIs (back-end)
      </li>
      <li>
        Responsive and accessible site design
      </li>
      <li>
        Rubocop linting and i18n/localization support
        <a href="http://www.marydickson.info/about?locale=es"> (try it in Spanish!)</a>
      </li>
      <li>
        Rails Action Storage / AWS S3 integration
      </li>
      <li>
        Support for markdown view rendering
      </li>
      <li>
        Rspec and Travis testing and continuous integration
      </li>
    </ul>
    <p>
      Since first launching this site in 2015, I have upgraded it from Rails 4 to Rails 5.3.
    </p>
    <p>
      Please enjoy!
    </p>
  </div>
);

export default Home;
