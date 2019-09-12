import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from './reducers';

const initialState = {
  commonplaces: [
    {
      author: 'test author',
      url: 'http://www.google.com',
      notes: 'some notes',
      quote: 'test quote',
    },
  ],
};

export default function configureStore() {
  const store = createStore(
    rootReducer,
    initialState,
    applyMiddleware(thunk),
  );
  return store;
}
