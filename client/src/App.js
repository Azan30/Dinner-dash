import './App.css';
import Category from './components/categories/Category'
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import Item from './components/Items/Item';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Navbar from './components/NavBar/Navbar'
import CategoryShow from './components/categories/CategoryShow';
import ItemShow from './components/Items/ItemShow';

function App() {
  return (
    <div className="container">
      <Router>
        <Navbar />
          <Switch>
            <Route exact path="/categories" component={Category} />
            <Route exact path="/categories/:id" component={CategoryShow} />
            <Route exact path="/items" component={Item} />
            <Route exact path="/items/:id" component={ItemShow} />
          </Switch>
      </Router>
    </div>
  );
}

export default App;
