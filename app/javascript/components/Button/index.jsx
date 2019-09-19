import React from 'react';
import PropTypes from 'prop-types';

const Button = (
  props,
) => {
  const { admin, onClick, text } = props;
  // console.log(props)
  if (admin) {
    return <button type="submit" onClick={onClick}>{text}</button>;
  }
  return null;
};

export default Button;

Button.propTypes = {
  admin: PropTypes.bool,
  onClick: PropTypes.func,
  text: PropTypes.string,
};

Button.defaultProps = {
  admin: false,
  onClick: () => {},
  text: '',
};
