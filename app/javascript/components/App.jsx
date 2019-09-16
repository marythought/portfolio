import React from 'react';
import PropTypes from 'prop-types';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Commonplaces from './Commonplaces/index';
import Home from './Home/index';

const App = (
  props,
) => (
  <BrowserRouter>
    <Switch>
      <Route exact path="/" render={() => <Home />} />
      <Route path="/commonplaces" render={() => <Commonplaces admin={props.admin} />} />
    </Switch>
  </BrowserRouter>
);

export default App;

App.propTypes = {
  admin: PropTypes.bool,
};

App.defaultProps = {
  admin: false,
};
