import React from "react"
import { Link } from "react-router-dom"
import { useCurrentUser } from "./CurrentUserContext"
import fetchWithCsrf from "./fetchWithCsrf"

const Header = () => {
  const { currentUser, fetchCurrentUser } = useCurrentUser()

  React.useEffect(() => fetchCurrentUser(), [])

  const logout = async (e) => {
    e.preventDefault()

    let response = await fetchWithCsrf("/api/session", { method: "DELETE" })

    fetchCurrentUser()
  }

  return (
    <div className="m-4">
      <Link to="/" className="text-5xl text-center block">📙</Link>

      {currentUser && (
        <div className="flex">
          <Link to={`/👤/${currentUser.name}`} className="block w-full text-center text-3xl">
            {currentUser.name}
          </Link>
          <a href="#" onClick={(e) => logout(e)} className="block w-full text-center text-3xl">
            🔌
          </a>
        </div>
      )}

      {!currentUser && (
        <div className="flex">
          <Link to="/📝" className="block w-full text-center text-3xl">
            📝
          </Link>
          <Link to="/🔒" className="block w-full text-center text-3xl">
            🔒
          </Link>
        </div>
      )}
    </div>
  )
}

export default Header
