import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { createStructuredSelector } from 'reselect';
import { List } from 'semantic-ui-react';
import { getCommonplaces } from '../actions';

// eslint-disable-next-line no-shadow
const Commonplaces = ({ commonplaces, getCommonplaces }) => {
  const commonplacesList = commonplaces.map((commonplace) => (
    <List.Item>
      <List.Icon name="arrow circle right" size="large" verticalAlign="middle" />
      <List.Content>
        <List.Header as="a" href={commonplace.url}>{commonplace.quote}</List.Header>
        <List.Description>{commonplace.notes}</List.Description>
        <List.Description>{commonplace.author}</List.Description>
      </List.Content>
    </List.Item>
  ));

  return (
    <>
      <button type="submit" className="getCommonplacesBtn" onClick={() => getCommonplaces()}>load commonplaces</button>
      <br />
      <List>{ commonplacesList }</List>
    </>
  );
};

const structuredSelector = createStructuredSelector({
  commonplaces: (state) => state.commonplaces,
});

const mapDispatchToProps = { getCommonplaces };

Commonplaces.propTypes = {
  commonplaces: PropTypes.arrayOf(
    PropTypes.shape({
      author: PropTypes.string,
      notes: PropTypes.string,
      quote: PropTypes.string,
      url: PropTypes.string,
    }),
  ),
  getCommonplaces: PropTypes.func,
};

Commonplaces.defaultProps = {
  commonplaces: [{
    author: '',
    notes: '',
    quote: '',
    url: '',
  }],
  getCommonplaces: () => {},
};

export default connect(structuredSelector, mapDispatchToProps)(Commonplaces);
