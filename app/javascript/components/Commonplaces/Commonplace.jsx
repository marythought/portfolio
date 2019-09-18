import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';

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
    const { commonplace, handleDelete } = this.props;
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
          <button type="submit" onClick={() => this.handleEdit()}>Submit</button>
        </>
      );
    }
    return (
      <List.Item key={commonplace.id}>
        <List.Icon name="thumbtack" size="large" verticalAlign="middle" />
        <List.Content>
          <List.Header as="a" href={commonplace.url}>{commonplace.quote}</List.Header>
          <List.Description>
            Source:&nbsp;
            {commonplace.source}
          </List.Description>
          <List.Description>
            Notes:&nbsp;
            {commonplace.notes}
          </List.Description>
        </List.Content>
        <button type="submit" onClick={() => this.handleEdit()}>Edit</button>
        <button type="submit" onClick={() => handleDelete(commonplace.id)}>Delete</button>
      </List.Item>
    );
  }
}

Commonplace.propTypes = {
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
  commonplace: {
    id: '',
    source: '',
    quote: '',
    notes: '',
    url: '',
  },
};
