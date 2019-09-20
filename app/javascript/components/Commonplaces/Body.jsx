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
    this.handleDelete = this.handleDelete.bind(this);
    this.deleteCommonplace = this.deleteCommonplace.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
    this.updateCommonplace = this.updateCommonplace.bind(this);
  }

  componentDidMount() {
    fetch('/api/v1/commonplaces')
      .then((response) => response.json())
      .then((data) => {
        this.setState({ commonplaces: data });
      });
  }

  handleFormSubmit(formFields) {
    const { admin } = this.props;
    const body = JSON.stringify({
      commonplace: {
        source: formFields.source.value,
        url: formFields.url.value,
        notes: formFields.notes.value,
        quote: formFields.quote.value,
        publish: admin,
      },
    });
    fetch('/api/v1/commonplaces', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body,
    }).then((response) => response.json())
      .then((commonplace) => {
        this.addNewCommonplace(commonplace);
      });
  }

  handleDelete(id) {
    fetch(`/api/v1/commonplaces/${id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
    }).then(() => {
      this.deleteCommonplace(id);
    });
  }

  deleteCommonplace(id) {
    const { commonplaces } = this.state;
    const newCommonplaces = commonplaces.filter((commonplace) => commonplace.id !== id);
    this.setState({
      commonplaces: newCommonplaces,
    });
  }

  handleUpdate(commonplace) {
    fetch(`/api/v1/commonplaces/${commonplace.id}`, {
      method: 'PUT',
      body: JSON.stringify({ commonplace }),
      headers: {
        'Content-Type': 'application/json',
      },
    }).then(() => {
      this.updateCommonplace(commonplace);
    });
  }

  updateCommonplace(commonplace) {
    const { commonplaces } = this.state;
    const newCommonplaces = commonplaces.filter((f) => f.id !== commonplace.id);
    newCommonplaces.push(commonplace);
    const sorted = newCommonplaces.sort((x, y) => (
      (new Date(y.created_at).getTime()) - (new Date(x.created_at).getTime())
    ));
    this.setState({
      commonplaces: sorted,
    });
  }

  addNewCommonplace(cpl) {
    const { commonplaces } = this.state;
    this.setState({
      commonplaces: [cpl].concat(commonplaces),
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
        <CommonplacesList
          admin={admin}
          commonplaces={commonplaces}
          handleDelete={this.handleDelete}
          handleUpdate={this.handleUpdate}
        />
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
