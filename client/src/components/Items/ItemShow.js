import React, { Component } from 'react'
import axios from 'axios'


class ItemShow extends Component{
  constructor(props){
    super(props)
      this.state = {
        item: []
      }
  }

  componentDidMount(){
    const { id } = this.props.match.params
    axios.get(`/api/v1/items/${id}`)
    .then(response => {
      console.log("fixed -response",response)
      this.setState({
        item: response.data
      })
    })
    .catch(error => console.log(error))
  }

  render (){
    return (
      <div>
        <p>
          <strong>Title: </strong>
          {this.state.item.title}
        </p>
        <p>
          <strong>Description: </strong>
          {this.state.item.description}
        </p>
        <p>
          <strong>Price: </strong>
          {this.state.item.price}
        </p>
      </div>
    )
  }
}
export default ItemShow
