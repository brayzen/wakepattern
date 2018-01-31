import React from "react"
import PropTypes from "prop-types"

class Feedback extends React.Component{
  render(){
    console.log(this.props)
    return <div className="feedback">
        <div className="recipient">{ this.props.receiver.name }</div>
        <div className="message">{ this.props.message }</div>
      </div>
  }
}

export default Feedback
