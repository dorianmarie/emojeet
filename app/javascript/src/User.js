import React from "react"
import { Link } from "react-router-dom"
import { withRouter } from "react-router"

const User = ({ match }) => {
  const [user, setUser] = React.useState(null)

  const fetchUser = async () => {
    let response = await fetch(`/api/users/${match.params.name}`)

    if (response.status === 200) {
      response = await response.json()
      setUser(response)
    }
  }

  React.useEffect(() => {
    fetchUser()
  }, [])

  if (!user) {
    return <div></div>
  }

  return (
    <>
      {user.messages.map((message) => (
        <div key={message.id} className="p-2">
          <Link to={`/👤/${user.name}`} className="block">
            {user.name}
          </Link>
          <Link to={`/💬/${message.id}`} className="pl-4 block">{message.content}</Link>
        </div>
      ))}
    </>
  )
}

export default withRouter(User)
