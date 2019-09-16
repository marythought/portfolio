import React from 'react';
import { List } from 'semantic-ui-react';

export default class CommonplacesList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      commonplaces: [],
    };
  }

  componentDidMount() {
    fetch('/api/v1/commonplaces')
      .then((response) => response.json())
      .then((data) => {
        this.setState({ commonplaces: data });
      });
  }

  render() {
    const { commonplaces } = this.state;
    const list = commonplaces.map((commonplace) => (
      <List.Item key={commonplace.id}>
        <List.Icon name="arrow circle right" size="large" verticalAlign="middle" />
        <List.Content>
          <List.Header as="a" href={commonplace.url}>{commonplace.quote}</List.Header>
          <List.Description>{commonplace.notes}</List.Description>
          <List.Description>{commonplace.source}</List.Description>
        </List.Content>
      </List.Item>
    ));
    return (
      <List>
        {list}
      </List>
    );
  }
}
