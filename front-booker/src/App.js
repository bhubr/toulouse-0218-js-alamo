import React, { Component, Fragment } from 'react'
import Homepage from './Homepage'
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom'
import Reservation from './Reservation';

class App extends Component {
  constructor (props) {
    super(props)
    this.state = {
      
    }
  }
  
  render () {
    return (
      <Router>
        <div className="App">
          <Switch>
            <Route exact path='/' render={()=> <Homepage />} />
            <Route exact path='/s/:sport/:city' component={Homepage} />
            <Route exact path='/reservation/:id' component={Reservation} />
          </Switch>
        </div>
      </Router>
    )
  }
}

export default App
