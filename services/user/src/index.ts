import express from "express"

const app = express()

app.get("/user", (req, res) => {
    res.status(200).json({
        message: "user"
    })
})

app.listen(3000)