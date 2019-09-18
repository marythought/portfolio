import React from 'react';
import PropTypes from 'prop-types';
import text from './text';
import Body from './Body';

const Commonplaces = (props) => {
  const { admin } = props;
  return (
    <div className="large-8 columns bottom-margin">
      <h1>A Commonplace Book</h1>
      <p>Commonplace books are a tool for recording and remembering useful bits of information.</p>
      <p>
        From
        <a href="https://en.wikipedia.org/wiki/Commonplace_book"> Wikipedia</a>
        {text}
      </p>
      <Body admin={admin} />
    </div>
  );
};

export default Commonplaces;

Commonplaces.propTypes = {
  admin: PropTypes.bool,
};

Commonplaces.defaultProps = {
  admin: false,
};
