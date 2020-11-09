import React from 'react'
import ReactDOM from 'react-dom'
import App from "../src/App"

import "../css/application.css"

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
