// @flow
import React, { Component } from 'react';
import { BrowserRouter as Router,
  Route, Switch } from 'react-router-dom';
import Home from '../Home';
import NotFound from '../../components/NotFound';

class App extends Component {
  render() {
    return (
      <Router>
        <div>
          <Switch>
            <Route path="/" exact component={Home} />
            <Route component={NotFound} />
          </Switch>
        </div>
      </Router>
    );
  }
}

export default App;
