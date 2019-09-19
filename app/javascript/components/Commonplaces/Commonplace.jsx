import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';
import Button from '../Button';
import LinkedQuote from './LinkedQuote';

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
      const { id } = commonplace;
      const newCommonplace = {
        id, source, quote, url, notes,
      };
      handleUpdate(newCommonplace);
    }
    this.setState({
      editable: !editable,
    });
  }

  render() {
    const { admin, commonplace, handleDelete } = this.props;
    const { editable } = this.state;

    if (editable) {
      return (
        <>
          Source
          <input type="text" ref={(input) => { this.source = input; }} defaultValue={commonplace.source} />
          Quote
          <input type="text" ref={(input) => { this.quote = input; }} defaultValue={commonplace.quote} />
          Url
          <input type="text" ref={(input) => { this.url = input; }} defaultValue={commonplace.url} />
          Notes
          <input type="text" ref={(input) => { this.notes = input; }} defaultValue={commonplace.notes} />
          <Button admin={admin} onClick={() => this.handleEdit()} text="Submit" />
        </>
      );
    }
    return (
      <List.Item key={commonplace.id}>
        <List.Icon name="thumbtack" size="large" verticalAlign="middle" />
        <List.Content>
          <LinkedQuote url={commonplace.url} quote={commonplace.quote} />
          <List.Description>
            {commonplace.source ? `Source: ${commonplace.source}` : '' }
          </List.Description>
          <List.Description>
            {commonplace.notes ? `Notes: ${commonplace.notes}` : ''}
          </List.Description>
        </List.Content>
        <Button admin={admin} onClick={() => this.handleEdit()} text="Edit" />
        <Button admin={admin} onClick={() => handleDelete(commonplace.id)} text="Delete" />
      </List.Item>
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
  },
};
