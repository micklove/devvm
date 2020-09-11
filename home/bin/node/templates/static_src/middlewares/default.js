import helmet from 'helmet'
import cors from 'cors'
import express from 'express'
import basicAuth from 'express-basic-auth'

export function applyMiddleware(server) {
    console.log("apply middleware")
    server.use(cors())
    server.use(helmet())
    server.use(basicAuth({
        users: {
            admin: process.env.ADMIN_NOT_VERY_SECRET
        },
        challenge: true
    }))
    server.use(express())
}