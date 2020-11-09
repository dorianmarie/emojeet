import React from "react"
import { useHistory } from "react-router-dom"
import { useCurrentUser } from "./CurrentUserContext"
import fetchWithCsrf from "./fetchWithCsrf"

const Login = () => {
  const [name, setName] = React.useState("")
  const [password, setPassword] = React.useState("")
  const [error, setError] = React.useState(false)

  const { fetchCurrentUser } = useCurrentUser()
  const history = useHistory()

  const submit = async (e) => {
    e.preventDefault()

    let response = await fetchWithCsrf("/api/session", {
      method: "POST",
      body: JSON.stringify({
        session: {
          name: name,
          password: password,
        }
      })
    })

    if (response.status === 200) {
      setError(false)
      fetchCurrentUser()
      history.push("/")
    } else {
      setError(true)
    }
  }

  return (
    <form onSubmit={(e) => submit(e)}>
      <div className="text-center text-5xl mb-4">🔒</div>
      {error && <div className="text-center text-2xl mb-4">❌</div>}
      <div className="flex mb-4">
        <div className="p-2 text-2xl">📛</div>
        <input
          type="text"
          className="border-black border rounded w-full p-2"
          onChange={(e) => setName(e.target.value)}
        />
      </div>
      <div className="flex mb-4">
        <div className="p-2 text-2xl">🔑</div>
        <input
          type="password"
          className="border-black border rounded w-full p2"
          onChange={(e) => setPassword(e.target.value)}
        />
      </div>
      <input
        type="submit"
        className="block border-black border rounded bg-white text-center m-auto px-4 text-2xl"
        value="✉️"
      />
    </form>
  )
}

export default Login
