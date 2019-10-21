import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';
import Button from '../Button';
import LinkedQuote from './LinkedQuote';
import CategoriesList from './CategoriesList';

export default class Commonplace extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editable: false,
    };
    this.handleEdit = this.handleEdit.bind(this);
  }

  handleEdit() {
    const { commonplace, handleUpdate } = this.props;
    const { editable } = this.state;
    if (editable) {
      const source = this.source.value;
      const url = this.url.value;
      const quote = this.quote.value;
      const notes = this.notes.value;
      const categories = this.categories.value;
      const publish = true;
      /* eslint-disable camelcase */
      const { created_at, id } = commonplace;
      const newCommonplace = {
        id, source, quote, url, notes, categories, publish, created_at,
      };
      /* eslint-enable camelcase */
      handleUpdate(newCommonplace);
    }
    this.setState({
      editable: !editable,
    });
  }

  editView() {
    const { admin, commonplace } = this.props;
    return (
      <>
        Source
        <input type="text" size="100" ref={(input) => { this.source = input; }} defaultValue={commonplace.source} />
        <br />
        Quote
        <input type="text" size="100" ref={(input) => { this.quote = input; }} defaultValue={commonplace.quote} />
        <br />
        Url
        <input type="text" size="100" ref={(input) => { this.url = input; }} defaultValue={commonplace.url} />
        <br />
        Notes
        <input type="text" size="100" ref={(input) => { this.notes = input; }} defaultValue={commonplace.notes} />
        <br />
        Categories (separate with a semi-colon)
        <input type="text" size="100" ref={(input) => { this.categories = input; }} defaultValue={commonplace.categories} />
        <br />
        {/* TODO: Add an admin checkbox for publish */}
        <Button admin={admin} onClick={() => this.handleEdit()} text="Submit" />
      </>
    );
  }

  displayView() {
    const { admin, commonplace, handleDelete } = this.props;
    return (
      <List.Item>
        <List.Icon name="thumbtack" size="large" verticalAlign="middle" />
        <List.Content>
          <LinkedQuote url={commonplace.url} quote={commonplace.quote} />
          <List.Description>
            {commonplace.source ? `Source: ${commonplace.source}` : ''}
          </List.Description>
          <List.Description>
            {commonplace.notes ? `Notes: ${commonplace.notes}` : ''}
          </List.Description>
          <CategoriesList categories={commonplace.categories} />
        </List.Content>
        <Button admin={admin} onClick={() => this.handleEdit()} text="Edit" />
        <Button admin={admin} onClick={() => handleDelete(commonplace.id)} text="Delete" />
      </List.Item>
    );
  }

  render() {
    const { editable } = this.state;
    if (editable) {
      return (
        this.editView()
      );
    }
    return (
      this.displayView()
    );
  }
}

Commonplace.propTypes = {
  admin: PropTypes.bool,
  commonplace: PropTypes.shape({
    id: PropTypes.number,
    source: PropTypes.string,
    quote: PropTypes.string,
    notes: PropTypes.string,
    url: PropTypes.string,
    created_at: PropTypes.string,
    categories: PropTypes.string,
  }),
  handleDelete: PropTypes.func.isRequired,
  handleUpdate: PropTypes.func.isRequired,
};

Commonplace.defaultProps = {
  admin: false,
  commonplace: {
    id: '',
    source: '',
    quote: '',
    notes: '',
    url: '',
    created_at: '',
    categories: '',
  },
};
