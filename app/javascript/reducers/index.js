import { combineReducers } from 'redux';
import CommonplacesReducer from './commonplaces';

const rootReducer = combineReducers({
  commonplaces: CommonplacesReducer,
});

export default rootReducer;
