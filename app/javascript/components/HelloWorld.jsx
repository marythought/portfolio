import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { createStructuredSelector } from 'reselect';
import { List } from 'semantic-ui-react';
import { getThings } from '../actions';

// eslint-disable-next-line no-shadow
const HelloWorld = ({ things, getThings }) => {
  const thingsList = things.map((thing) => (
    <List.Item>
      <List.Icon name="arrow circle right" size="large" verticalAlign="middle" />
      <List.Content>
        <List.Header as="a">{thing.name}</List.Header>
        <List.Description as="a">{thing.guid}</List.Description>
      </List.Content>
    </List.Item>
  ));

  return (
    <>
      <button type="submit" className="getThingsBtn" onClick={() => getThings()}>getThings</button>
      <br />
      <List>{ thingsList }</List>
    </>
  );
};

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
  getThings: PropTypes.func,
};

HelloWorld.defaultProps = {
  things: [{ name: 'test', guid: 'abc' }],
  getThings: () => {},
};

export default connect(structuredSelector, mapDispatchToProps)(HelloWorld);
