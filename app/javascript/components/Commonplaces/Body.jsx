import React from 'react';
import PropTypes from 'prop-types';
import CommonplacesList from './CommonplacesList';
import NewCommonplace from './NewCommonplace';

export default class Body extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      commonplaces: [],
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.addNewCommonplace = this.addNewCommonplace.bind(this);
  }

  componentDidMount() {
    fetch('/api/v1/commonplaces')
      .then((response) => response.json())
      .then((data) => {
        this.setState({ commonplaces: data });
      });
  }

  handleFormSubmit(formFields) {
    const body = JSON.stringify({
      commonplace: {
        source: formFields.source.value,
        url: formFields.url.value,
        notes: formFields.notes.value,
        quote: formFields.quote.value,
      }
    });
    fetch('/api/v1/commonplaces', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body,
    }).then((response) => { return response.json() })
      .then((commonplace) => {
        this.addNewCommonplace(commonplace)
      });
  }

  addNewCommonplace(cpl) {
    this.setState({
      commonplaces: [cpl].concat(this.state.commonplaces),
    });
  }

  render() {
    const { commonplaces } = this.state;
    const { admin } = this.props;
    return (
      <div>
        <NewCommonplace
          admin={admin}
          handleFormSubmit={this.handleFormSubmit}
        />
        <CommonplacesList commonplaces={commonplaces} />
      </div>
    );
  }
}

Body.propTypes = {
  admin: PropTypes.bool,
};

Body.defaultProps = {
  admin: false,
};
