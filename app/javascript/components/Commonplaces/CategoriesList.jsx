import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';

const CategoriesList = (
  props,
) => {
  const { categories } = props;
  if (categories) {
    const list = categories.split(';').map((category, i) => (
      /* eslint-disable react/no-array-index-key */
      <List horizontal key={i}>
        <List.Item>
          <List.Content>
            <List.Header as="a" className="pad-right">{category}</List.Header>
          </List.Content>
        </List.Item>
      </List>
      /* eslint-enable react/no-array-index-key */
    ));
    return list;
  }
  return null;
};

export default CategoriesList;

CategoriesList.propTypes = {
  categories: PropTypes.string,
};

CategoriesList.defaultProps = {
  categories: '',
};
