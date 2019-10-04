import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';

const CategoriesList = (
  props,
) => {
  const { categories } = props;
  if (categories) {
    const list = categories.map((category, i) => (
      <List horizontal key={i}>
        <List.Item>
          <List.Content>
            <List.Header as="a" className="pad-right">{category}</List.Header>
          </List.Content>
        </List.Item>
      </List>
    ));
    return list;
  }
  return null;
};

export default CategoriesList;

CategoriesList.propTypes = {
  categories: PropTypes.arrayOf(PropTypes.string),
};

CategoriesList.defaultProps = {
  categories: [],
};
