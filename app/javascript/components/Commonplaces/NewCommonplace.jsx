import React from 'react';
import PropTypes from 'prop-types';

const NewCommonplace = (props) => {
  const { admin, handleFormSubmit } = props;
  const formFields = {};
  const values = {};

  if (admin) {
    return (
      <form onSubmit={(e) => {
        e.preventDefault();
        handleFormSubmit(formFields);
        e.target.reset();
      }}
      >
        <label htmlFor="source">
          Source:
          <input ref={(input) => { formFields.source = input; }} name="source" type="text" value={values.source} />
        </label>
        <br />
        <label htmlFor="quote">
          Quote:
          <textarea ref={(input) => { formFields.quote = input; }} name="quote" value={values.quote} />
        </label>
        <br />
        <label htmlFor="url">
          URL:
          <input ref={(input) => { formFields.url = input; }} name="url" type="text" value={values.url} />
        </label>
        <br />
        <label htmlFor="notes">
          Notes:
          <textarea ref={(input) => { formFields.notes = input; }} name="notes" value={values.notes} />
        </label>
        <br />
        <input type="submit" value="Submit" />
      </form>
    );
  }
  return null;
};

export default NewCommonplace;

NewCommonplace.propTypes = {
  admin: PropTypes.bool,
  handleFormSubmit: PropTypes.func.isRequired,
};

NewCommonplace.defaultProps = {
  admin: false,
};
