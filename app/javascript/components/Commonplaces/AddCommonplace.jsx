import { withFormik } from 'formik';
import CommonplaceForm from './CommonplaceForm';

const commonplaceCreated = (response, props, setSubmitting) => {
  setSubmitting(false);
  // TODO: clear the form and re-render the CommonplacesList
};

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
  // isInitialValid: (props) => !!props.note.patient && !!props.note.notes,
  // validationSchema: yup.object().shape({
  //   patient: yup.object().shape({
  //     id: yup.number().required(),
  //   }),
  //   actions: yup.array().of(yup.string()),
  //   notes: yup.string().required(),
  //   actionsMinutes: yup.number(),
  //   inPerson: yup.boolean(),
  //   sendToEhr: yup.boolean(),
  //   trackTime: yup.boolean(),
  // }),
  handleSubmit: (values, { props, setSubmitting }) => {
    submit(values).then(
      (response) => commonplaceCreated(response, props, setSubmitting),
    );
  },
})(CommonplaceForm);
