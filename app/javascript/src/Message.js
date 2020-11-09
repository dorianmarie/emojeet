import React from "react"
import { Link } from "react-router-dom"
import { withRouter } from "react-router"

const Message = ({ match }) => {
  const [message, setMessage] = React.useState(null)

  const fetchMessage = async () => {
    let response = await fetch(`/api/messages/${match.params.id}`)

    if (response.status === 200) {
      response = await response.json()
      setMessage(response)
    }
  }

  React.useEffect(() => {
    fetchMessage()
  }, [])

  if (!message) {
    return <div></div>
  }

  return (
    <div key={message.id} className="p-2">
      <Link to={`/👤/${message.user.name}`} className="block">
        {message.user.name}
      </Link>
      <Link to={`/💬/${message.id}`} className="pl-4 block">{message.content}</Link>
    </div>
  )
}

export default withRouter(Message)
