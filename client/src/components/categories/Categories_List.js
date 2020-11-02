import React from 'react'
import { Link, withRouter } from 'react-router-dom'

const CategoriesList = ({list}) => {
    return (
      <tr key={list.id}>
        <td>{list.title}</td>
        <td className="btn btn primary">
          <Link to={`categories/${list.id}`} >Show</Link>
        </td>
      </tr>
    )
}
export default  withRouter(CategoriesList);
