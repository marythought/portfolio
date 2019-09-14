import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';
import text from './text';
import AddCommonplace from './AddCommonplace';

export default class Commonplaces extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }

  commonplacesList() {
    const { commonplaces } = this.props;

    return (
      commonplaces.map((commonplace) => (
        <List.Item key={commonplace.id}>
          <List.Icon name="arrow circle right" size="large" verticalAlign="middle" />
          <List.Content>
            <List.Header as="a" href={commonplace.url}>{commonplace.quote}</List.Header>
            <List.Description>{commonplace.notes}</List.Description>
            <List.Description>{commonplace.author}</List.Description>
          </List.Content>
        </List.Item>
      ))
    )
  }

  render() {
    return (
      <div className="large-8 columns bottom-margin">
        <h1>A Commonplace Book</h1>
        <p>{text}</p>
        <p>
          From
          <a href="https://en.wikipedia.org/wiki/Commonplace_book"> Wikipedia</a>
          : &quot;Each one is unique to its creator&apos;s particular interests but they almost always include passages found in other texts, sometimes accompanied by the compiler&apos;s responses.&quot;
        </p>
        <AddCommonplace />
        <List>{this.commonplacesList()}</List>
      </div>
    );
  }
}

Commonplaces.propTypes = {
  commonplaces: PropTypes.arrayOf(
    PropTypes.shape({
      author: PropTypes.string,
      notes: PropTypes.string,
      quote: PropTypes.string,
      url: PropTypes.string,
    }),
  ),
};

Commonplaces.defaultProps = {
  commonplaces: [{
    author: '',
    notes: '',
    quote: '',
    url: '',
  }],
};
