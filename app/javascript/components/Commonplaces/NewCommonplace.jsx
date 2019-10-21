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
          <input size="50" ref={(input) => { formFields.source = input; }} name="source" type="text" value={values.source} />
        </label>
        <br />
        <label htmlFor="quote">
          Quote:
          <br />
          <textarea rows="5" cols="50" ref={(input) => { formFields.quote = input; }} name="quote" value={values.quote} />
        </label>
        <br />
        <label htmlFor="url">
          URL:
          <br />
          <input size="50" ref={(input) => { formFields.url = input; }} name="url" type="text" value={values.url} />
        </label>
        <br />
        <label htmlFor="notes">
          Notes:
          <br />
          <textarea rows="5" cols="50" ref={(input) => { formFields.notes = input; }} name="notes" value={values.notes} />
        </label>
        <br />
        <label htmlFor="categories">
          Categories: (separate multiple with semicolon)
          <br />
          <input size="50" ref={(input) => { formFields.categories = input; }} name="categories" value={values.categories} />
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
