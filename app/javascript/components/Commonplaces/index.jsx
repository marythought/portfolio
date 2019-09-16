import React from 'react';
import PropTypes from 'prop-types';
import text from './text';
import Body from './Body';

const Commonplaces = (props) => {
  const { admin } = props;
  return (
    <div className="large-8 columns bottom-margin">
      <h1>A Commonplace Book</h1>
      <p>{text}</p>
      <p>
        From
        <a href="https://en.wikipedia.org/wiki/Commonplace_book"> Wikipedia</a>
        : &quot;Each one is unique to its creator&apos;s particular interests but they almost always include passages found in other texts, sometimes accompanied by the compiler&apos;s responses.&quot;
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
