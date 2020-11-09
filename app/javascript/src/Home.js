import React from "react"
import { Link } from "react-router-dom"

const Home = () => {
  const [messages, setMessages] = React.useState([])

  const fetchMessages = async () => {
    let response = await fetch("/api/messages")
    response = await response.json()
    setMessages(response.messages)
  }

  React.useEffect(() => {
    fetchMessages()
  }, [])

  return (
    <>
      {messages.map((message) => (
        <div key={message.id} className="p-2">
          <Link to={`/👤/${message.user.name}`} className="block">
            {message.user.name}
          </Link>
          <Link to={`/💬/${message.id}`} className="pl-4 block">
            {message.content}
          </Link>
        </div>
      ))}
    </>
  )
}

export default Home
