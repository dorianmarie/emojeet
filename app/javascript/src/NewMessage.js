import React from "react"
import fetchWithCsrf from "./fetchWithCsrf"

const NewMessage = () => {
  const [content, setContent] = React.useState("")
  const [error, setError] = React.useState(false)

  const submit = async (e) => {
    e.preventDefault()

    let response = await fetchWithCsrf("/api/messages", {
      method: "POST",
      body: JSON.stringify({
        message: {
          content: content,
        }
      })
    })

    if (response.status === 200) {
      setError(false)
      window.location.reload()
    } else {
      setError(true)
    }
  }

  return (
    <form onSubmit={(e) => submit(e)}>
      {error && <div className="text-center text-2xl mb-4">❌</div>}
      <div className="flex">
        <input
          type="text"
          className="border-black border rounded w-full p-2"
          onChange={(e) => setContent(e.target.value)}
        />
        <input
          type="submit"
          className="block border-black border rounded bg-white text-center m-auto px-4 py-2 ml-2 text-2xl"
          value="✉️"
        />
      </div>
    </form>
  )
}

export default NewMessage
