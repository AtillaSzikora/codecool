import express from "express";

const app = express();
const PORT = process.env.PORT;

app.get("/", (req, res) => {
  res.send("Hello, Kalman!");
});

app.listen(
  PORT,
  () => console.log("The server is running on http://localhost:" + PORT)
);
