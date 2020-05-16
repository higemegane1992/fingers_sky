import React from "react"
import PropTypes from "prop-types"
class Jumbotron extends React.Component {
  render () {
    return (
      <div className="jumbotron">
        <h1 className="display-4">{this.props.title}</h1>
        <p className="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
        <hr className="my-4" />
        <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
      </div>
    );
  }
}

Jumbotron.propTypes = {
  title: PropTypes.string
};
export default Jumbotron
