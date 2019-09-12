const initialState = [];

const ThingsReducer = (state = initialState, action) => {
  switch (action.type) {
    case 'GET_THINGS_SUCCESS':
      return action.json.things;
    default:
      return state;
  }
};

export default ThingsReducer;
