import { combineReducers } from 'redux';
import ThingsReducer from './things';

const rootReducer = combineReducers({
  things: ThingsReducer,
});

export default rootReducer;
