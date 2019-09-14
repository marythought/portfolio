import React from 'react';
import PropTypes from 'prop-types';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Commonplaces from './Commonplaces/index';
import Home from './Home/index';

const App = (props) => (
  <BrowserRouter>
    <Switch>
      <Route exact path="/" render={() => <Home />} />
      <Route path="/commonplaces" render={() => <Commonplaces commonplaces={props.commonplaces} />} />
    </Switch>
  </BrowserRouter>
);

export default App;

App.propTypes = {
  commonplaces: PropTypes.arrayOf(
    PropTypes.shape,
  ),
};

App.defaultProps = {
  commonplaces: [],
};
