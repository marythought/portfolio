/* global fetch */
export const GET_COMMONPLACES_REQUEST = 'GET_COMMONPLACES_REQUEST';
export const GET_COMMONPLACES_SUCCESS = 'GET_COMMONPLACES_SUCCESS';

export function getCommonplacesSuccess(json) {
  return {
    type: GET_COMMONPLACES_SUCCESS,
    json,
  };
}

export function getCommonplaces() {
  return (dispatch) => {
    dispatch({
      type: GET_COMMONPLACES_REQUEST,
    });
    return fetch('api/v1/commonplaces')
      .then((response) => response.json())
      .then((json) => dispatch(getCommonplacesSuccess(json)))
      .catch((error) => console.log(error));
  };
}
