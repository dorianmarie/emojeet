import React from "react"
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"
import { CurrentUserProvider } from "./CurrentUserContext"
import Header from "./Header"
import Home from "./Home"
import Signup from "./Signup"
import Login from "./Login"
import User from "./User"
import Message from "./Message"

const App = () => (
  <CurrentUserProvider>
    <Router>
      <div className="max-w-xs m-auto">
        <Header />
        <Switch>
          <Route path="/👤/:name">
            <User />
          </Route>
          <Route path="/💬/:id">
            <Message />
          </Route>
          <Route exact path="/📝">
            <Signup />
          </Route>
          <Route exact path="/🔒">
            <Login />
          </Route>
          <Route exact path="/">
            <Home />
          </Route>
          <Route path="/">
            <div className="text-center text-5xl">🤷‍♀️</div>
          </Route>
        </Switch>
      </div>
    </Router>
  </CurrentUserProvider>
)

export default App
