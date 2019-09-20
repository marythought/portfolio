import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';

const LinkedQuote = (
  props,
) => {
  const { url, quote } = props;
  if (url) {
    return <List.Header as="a" href={url}>{quote}</List.Header>;
  }
  return <List.Header>{quote}</List.Header>;
};

export default LinkedQuote;

LinkedQuote.propTypes = {
  url: PropTypes.string,
  quote: PropTypes.string,
};

LinkedQuote.defaultProps = {
  url: '',
  quote: '',
};
