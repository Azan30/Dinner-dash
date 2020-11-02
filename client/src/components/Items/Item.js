import React, { Component } from 'react'
import axios from 'axios'
import ItemList from './Items_List'

class Item extends Component{
  constructor(props){
    super(props)
      this.state = {
        lists: []
      }
  }

  componentDidMount(){
    axios.get('api/v1/items.json')
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
              <th>Description</th>
              <th>Price</th>
              <th>View Item</th>
            </tr>
          </thead>
          <tbody>
            {
              this.state.lists.map( (list,index) => {
                return (<ItemList list={list} key={index}/>)
              })
            }
          </tbody>
        </table>
      </div>
    )
  }
}
export default Item
