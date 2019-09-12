const initialState = [];

const CommonplacesReducer = (state = initialState, action) => {
  switch (action.type) {
    case 'GET_COMMONPLACES_SUCCESS':
      return action.json;
    default:
      return state;
  }
};

export default CommonplacesReducer;
