
import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import { Provider } from 'react-redux';
import Commonplaces from './Commonplaces/index';
import Home from './Home/index';
import configureStore from '../configureStore';

const store = configureStore();

const App = () => (
  <Provider store={store}>
    <BrowserRouter>
      <Switch>
        <Route exact path="/" render={() => <Home />} />
        <Route path="/commonplaces" render={() => <Commonplaces />} />
      </Switch>
    </BrowserRouter>
  </Provider>
);

export default App;
