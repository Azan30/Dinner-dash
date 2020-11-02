import React, { Component } from 'react'
import axios from 'axios'
import CategoriesList from './Categories_List'

class Category extends Component{
  constructor(props){
    super(props)
      this.state = {
        lists: []
      }
  }



  componentDidMount(){
    axios.get('api/v1/categories.json')
    .then(response => {
      console.log(response)
      this.setState({
        lists: response.data
      })
    })
    .catch(error => console.log(error))
  }

  render (){
    return (
      <div className="container">
        <table className="table">
          <thead>
            <tr>
              <th>Title</th>
            </tr>
          </thead>
          <tbody>
            {
              this.state.lists.map((list, index) => {
                return (<CategoriesList list={list} key={index}/>)
              })
            }
          </tbody>
        </table>
      </div>
    )
  }
}
export default Category
