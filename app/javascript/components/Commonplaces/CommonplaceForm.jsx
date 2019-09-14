import React from 'react';
import PropTypes from 'prop-types';

export default class CommonplaceForm extends React.Component {
  constructor(props) {
    super(props);

    this.handleAuthorChange = this.handleAuthorChange.bind(this);
    this.handleNotesChange = this.handleNotesChange.bind(this);
    this.handleUrlChange = this.handleUrlChange.bind(this);
    this.handleQuoteChange = this.handleQuoteChange.bind(this);
  }

  handleInputChange(event) {
    const { setFieldValue } = this.props;

    const { target } = event.target;
    const { value } = target.value;
    const { name } = target.name;

    this.setState({
      [name]: value
    });

    setFieldValue(name, value)
  }

  handleAuthorChange(event) {
    const { setFieldValue, updateValues } = this.props;
    setFieldValue('author', event.target.value)
  }

  handleUrlChange(event) {
    const { setFieldValue, updateValues } = this.props;
    setFieldValue('url', event.target.value)
  }

  handleNotesChange(event) {
    const { setFieldValue, updateValues } = this.props;
    setFieldValue('notes', event.target.value)
  }

  handleQuoteChange(event) {
    const { setFieldValue, updateValues } = this.props;
    setFieldValue('quote', event.target.value)
  }

  render() {
    const {
      values, setFieldValue, handleSubmit,
    } = this.props;
    console.log(values)
    return (
      <form onSubmit={handleSubmit}>
        <label htmlFor="something">
          Author:
          <input type="text" value={values.author} onChange={this.handleAuthorChange} />
        </label>
        <br></br>
        <label htmlFor="something">
          Quote:
          <input type="text" value={values.quote} onChange={this.handleQuoteChange} />
        </label>
        <br></br>
        <label htmlFor="something">
          URL:
          <input type="text" value={values.url} onChange={this.handleUrlChange} />
        </label>
        <br></br>
        <label htmlFor="something">
          Notes:
          <textarea value={values.notes} onChange={this.handleNotesChange} />
        </label>
        <br></br>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
