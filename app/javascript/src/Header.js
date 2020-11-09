import React from "react"
import { Link } from "react-router-dom"

const Header = () => {
  return (
    <div className="m-4">
      <Link to="/" className="text-5xl text-center block">📙</Link>
      <div className="flex">
        <Link to="/📝" className="block w-full text-center text-3xl">
          📝
        </Link>
        <Link to="/🔒" className="block w-full text-center text-3xl">
          🔒
        </Link>
      </div>
    </div>
  )
}

export default Header
