import React from 'react';
import text from './text';
import AddCommonplace from './AddCommonplace';
import CommonplacesList from './CommonplacesList';

export default class Commonplaces extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
    };
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
        <CommonplacesList />
      </div>
    );
  }
}
