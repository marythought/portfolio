import { withFormik } from 'formik';
import CommonplaceForm from './CommonplaceForm';

const commonplaceCreated = (response, props, setSubmitting) => {
  setSubmitting(false);
  props.onCancel();
};

export default withFormik({
  mapPropsToValues: (props) => ({
    author: props.author,
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
    props.onSubmit(values).then(
      (response) => commonplaceCreated(response, props, setSubmitting),
    );
  },
})(CommonplaceForm);
