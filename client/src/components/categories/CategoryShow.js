import React, { Component } from 'react'
import axios from 'axios'


class CategoryShow extends Component{
  constructor(props){
    super(props)
      this.state = {
        category: []
      }
  }

  componentDidMount(){
    const { id } = this.props.match.params
    axios.get(`/api/v1/categories/${id}`)
    .then(response => {
      console.log("fixed -response",response)
      this.setState({
        category: response.data
      })
    })
    .catch(error => console.log(error))
  }

  render (){
    return (
      <div className="container">
        <div>
          {this.state.category.title}
        </div>
      </div>
    )
  }
}
export default CategoryShow
