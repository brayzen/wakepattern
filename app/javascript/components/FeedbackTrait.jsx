import React from "react"
import PropTypes from "prop-types"

class FeedbackTrait extends React.Component{
  render(){
    return <div className="trait" data-name={this.props.name}>
        <div className="name">{this.props.name}</div>
        <div className="rating_stars">
          <Star/><Star/><Star/><Star/><Star/>
        </div>
      </div>
  }
}

class Star extends React.Component{
  render(){
    return <div className="star">
        <svg height="25" width="23">
          <polygon points="9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78"/>
        </svg>
      </div>
  }
}

export default FeedbackTrait
