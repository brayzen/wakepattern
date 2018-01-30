import React from "react"
import PropTypes from "prop-types"

class Feedback extends React.Component{
  render(){
    return <div className="feedback">{ this.props.message }</div>
  }
}

export default Feedback
