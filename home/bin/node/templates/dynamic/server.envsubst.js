import express from 'express'
import {applyMiddleware} from './middlewares/default.js'

const app = express()
const port = process.env.PROJECT_LISTEN_PORT || ${PROJECT_LISTEN_PORT}

applyMiddleware(app)

app.get('/', (req, res) => {
  res.send('Hello World! from ${PROJECT_NAME}')
})

app.listen(port, () => {
  console.log(`${PROJECT_NAME} listening at http://localhost:${port}`)
})
