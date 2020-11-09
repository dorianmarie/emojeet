const fetchWithCsrf = (url, params) => {
  let csrf = document.querySelector("meta[name='csrf-token']")
  csrf = csrf.getAttribute("content")

  if (!params.headers) {
    params.headers = {}
  }

  params.headers["Content-Type"] = "application/json"
  params.headers["X-CSRF-Token"] = csrf

  return fetch(url, params)
}

export default fetchWithCsrf
