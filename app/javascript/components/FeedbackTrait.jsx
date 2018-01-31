import React from "react"
import PropTypes from "prop-types"

class FeedbackTrait extends React.Component{
  render(){
    console.log(this.props)
    return <div className="feedback_trait">rating: { this.props.rating } </div>
  }
}

export default FeedbackTrait
