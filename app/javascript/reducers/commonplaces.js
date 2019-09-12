const initialState = [];

const CommonplacesReducer = (state = initialState, action) => {
  switch (action.type) {
    case 'GET_COMMONPLACES_SUCCESS':
      return action.json.commonplaces;
    default:
      return state;
  }
};

export default CommonplacesReducer;
