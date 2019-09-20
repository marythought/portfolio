import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';
import Commonplace from './Commonplace';

const CommonplacesList = (props) => {
  const {
    admin, commonplaces, handleDelete, handleUpdate,
  } = props;
  if (commonplaces && commonplaces.length) {
    const list = commonplaces.map((commonplace) => (
      <Commonplace
        admin={admin}
        commonplace={commonplace}
        handleDelete={handleDelete}
        handleUpdate={handleUpdate}
      />
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
  admin: PropTypes.bool.isRequired,
  commonplaces: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number,
      source: PropTypes.string,
      quote: PropTypes.string,
      notes: PropTypes.string,
      url: PropTypes.string,
    }),
  ).isRequired,
  handleDelete: PropTypes.func.isRequired,
  handleUpdate: PropTypes.func.isRequired,
};
