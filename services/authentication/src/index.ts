import express from "express"

const app = express()

app.get("/authentication", (req, res) => {
    res.status(200).json({
        message: "authentication"
    })
})

app.listen(3000)