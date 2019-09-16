import React from 'react';
import PropTypes from 'prop-types';

export default class CommonplaceForm extends React.Component {
  constructor(props) {
    super(props);

    this.handleInputChange = this.handleInputChange.bind(this);
  }

  handleInputChange(event) {
    const { setFieldValue } = this.props;
    const { value, name } = event.target;
    setFieldValue(name, value);
  }

  render() {
    const {
      admin, values, handleSubmit,
    } = this.props;
    if (admin) {
      return (
        <form onSubmit={handleSubmit}>
          <label htmlFor="source">
            Source:
            <input name="source" type="text" value={values.source} onChange={this.handleInputChange} />
          </label>
          <br />
          <label htmlFor="quote">
            Quote:
            <textarea name="quote" value={values.quote} onChange={this.handleInputChange} />
          </label>
          <br />
          <label htmlFor="url">
            URL:
            <input name="url" type="text" value={values.url} onChange={this.handleInputChange} />
          </label>
          <br />
          <label htmlFor="notes">
            Notes:
            <textarea name="notes" value={values.notes} onChange={this.handleInputChange} />
          </label>
          <br />
          <input type="submit" value="Submit" />
        </form>
      );
    }
    return null;
  }
}

CommonplaceForm.propTypes = {
  admin: PropTypes.bool,
  setFieldValue: PropTypes.func.isRequired,
  handleSubmit: PropTypes.func.isRequired,
  values: PropTypes.shape({
    source: PropTypes.string,
    url: PropTypes.string,
    notes: PropTypes.string,
    quote: PropTypes.string,
  }),
};

CommonplaceForm.defaultProps = {
  admin: false,
  values: {
    source: '',
    url: '',
    notes: '',
    quote: '',
  },
};
