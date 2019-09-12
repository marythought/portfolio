import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { createStructuredSelector } from 'reselect';
import { List } from 'semantic-ui-react';

const GET_THINGS_REQUEST = 'GET_THINGS_REQUEST';
const GET_THINGS_SUCCESS = 'GET_THINGS_SUCCESS';

function getThings() {
  return dispatch => {
    dispatch({ type: GET_THINGS_REQUEST });
    return fetch(`v1/api.json`)
      .then(response => response.json())
      .then(json => dispatch(getThingsSuccess(json)))
      .catch(error => console.log(error));
  };
}

export function getThingsSuccess(json) {
  return {
    type: GET_THINGS_SUCCESS,
    json,
  };
}

class HelloWorld extends React.Component {
  render() {
    const { things } = this.props;
    const thingsList = things.map((thing) => {
      return (
        <List.Item>
          <List.Icon name='arrow circle right' size='large' verticalAlign='middle' />
          <List.Content>
            <List.Header as='a'>{thing.name}</List.Header>
            <List.Description as='a'>{thing.guid}</List.Description>
          </List.Content>
        </List.Item>
      )
    });

    return (
      <>
        <button className="getThingsBtn" onClick={() => this.props.getThings()}>getThings</button>
        <br />
        <ul>{ thingsList }</ul>
      </>
    );
  }
}

const structuredSelector = createStructuredSelector({
  things: (state) => state.things,
});

const mapDispatchToProps = { getThings };

HelloWorld.propTypes = {
  greeting: PropTypes.string.isRequired,
};

export default connect(structuredSelector, mapDispatchToProps)(HelloWorld);