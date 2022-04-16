import express from "express"

const app = express()

app.get("/checkout", (req, res) => {
    res.status(200).json({
        message: "checkout"
    })
})

app.listen(3000)