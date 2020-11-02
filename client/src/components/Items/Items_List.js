import React from 'react'
import { Link, withRouter } from 'react-router-dom'

const ItemList = ({list}) => {
    return (
        <tr key={list.id}>
          <td>{list.title}</td>
          <td>{list.description}</td>
          <td>{list.price}</td>
          <td><Link to={`items/${list.id}`}> Show </Link> </td>
        </tr>
    )
}
export default withRouter(ItemList);
