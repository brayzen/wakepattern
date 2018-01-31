import React from "react"
import PropTypes from "prop-types"
import FeedbackTrait from './FeedbackTrait'

class Feedback extends React.Component{
  render(){
    console.log(this.props)
    return <div className="feedback">
        <div className="recipient">{ this.props.receiver.name }</div>
        <div className="message">{ this.props.message }</div>
        <div className="traits">
          {
            this.props.feedback_traits.map( (trait, i) =>{
              return <FeedbackTrait rating={ trait.rating } key={i}/>
            })
          }
        </div>
      </div>
  }
}

export default Feedback
