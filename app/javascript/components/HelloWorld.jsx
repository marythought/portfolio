import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { createStructuredSelector } from 'reselect';
import { List } from 'semantic-ui-react';

const GET_THINGS_REQUEST = 'GET_THINGS_REQUEST';
const GET_THINGS_SUCCESS = 'GET_THINGS_SUCCESS';

export function getThingsSuccess(json) {
  return {
    type: GET_THINGS_SUCCESS,
    json,
  };
}

function getThings() {
  return (dispatch) => {
    dispatch({ type: GET_THINGS_REQUEST });
    return fetch('v1/api.json')
      .then((response) => response.json())
      .then((json) => dispatch(getThingsSuccess(json)))
      .catch((error) => console.log(error));
  };
}

// eslint-disable-next-line react/prefer-stateless-function
class HelloWorld extends React.Component {
  render() {
    const { things } = this.props;
    const thingsList = things.map((thing) => {
      return (
        <List.Item>
          <List.Icon name="arrow circle right" size="large" verticalAlign="middle" />
          <List.Content>
            <List.Header as="a">{thing.name}</List.Header>
            <List.Description as="a">{thing.guid}</List.Description>
          </List.Content>
        </List.Item>
      );
    });

    return (
      <>
        <button className="getThingsBtn" onClick={() => this.props.getThings()}>getThings</button>
        <br />
        <List>{ thingsList }</List>
      </>
    );
  }
}

const structuredSelector = createStructuredSelector({
  things: (state) => state.things,
});

const mapDispatchToProps = { getThings };

HelloWorld.propTypes = {
  things: PropTypes.arrayOf(
    PropTypes.shape({
      guid: PropTypes.string,
      name: PropTypes.string,
    }),
  ),
};

HelloWorld.defaultProps = {
  things: [{ name: 'test', guid: 'abc' }],
};

export default connect(structuredSelector, mapDispatchToProps)(HelloWorld);
