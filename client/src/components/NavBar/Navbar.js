import React from "react";
import './Navbar.css';
import { NavLink } from 'react-router-dom';

function Navbar(){
    return (
      <>
        <div className="bgColor">
          <nav>
            <div className="left">
              <h1>Dinner Dash</h1>
            </div>
            <div className="right">
              <ul>
                <li className="nav-item">
                  <NavLink className="nav-link" to={"/items"}>Items</NavLink>
                </li>
                <li className="nav-item">
                  <NavLink className="nav-link" to={"/categories"}>Categories</NavLink>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </>
    )
}
export default Navbar;
