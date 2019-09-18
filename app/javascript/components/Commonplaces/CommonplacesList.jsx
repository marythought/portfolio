import React from 'react';
import PropTypes from 'prop-types';
import { List } from 'semantic-ui-react';
import Commonplace from './Commonplace';

const CommonplacesList = (props) => {
  const { commonplaces, handleDelete, handleUpdate } = props;
  if (commonplaces && commonplaces.length) {
    const list = commonplaces.map((commonplace) => (
      <Commonplace
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
  commonplaces: PropTypes.array.isRequired,
  handleDelete: PropTypes.func.isRequired,
  handleUpdate: PropTypes.func.isRequired,
};
