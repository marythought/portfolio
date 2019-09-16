import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';

const CommonplacesList = (
  props,
) => {
  const { commonplaces } = props;
  if (commonplaces && commonplaces.length) {
    const list = commonplaces.map((commonplace) => (
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
      </List.Item>
    ));
    return (
      <List className="very relaxed large">
        {list}
      </List>
    );
  }
  return null;
};

export default CommonplacesList;

CommonplacesList.propTypes = {
  commonplaces: PropTypes.arrayOf(
    PropTypes.shape({
      source: PropTypes.string,
      quote: PropTypes.string,
      notes: PropTypes.string,
      url: PropTypes.string,
    }),
  ).isRequired,
};
