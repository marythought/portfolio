import { withFormik } from 'formik';
import CommonplaceForm from './CommonplaceForm';

const submit = (values) => {
  const {
    source, url, quote, notes,
  } = values;
  const body = JSON.stringify({
    commonplace: {
      source,
      url,
      quote,
      notes,
    },
  });
  return fetch('/api/v1/commonplaces', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body,
  });
};

export default withFormik({
  mapPropsToValues: (props) => ({
    source: props.source,
    notes: props.notes,
    url: props.url,
    quote: props.quote,
  }),

  handleSubmit: (values) => {
    submit(values)
      .then((response) => response.json())
      .then((data) => {
        // clear form and re-render list
        console.log(data);
      });
  },
})(CommonplaceForm);
