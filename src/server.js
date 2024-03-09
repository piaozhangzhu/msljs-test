import express from "express";

const app = express();

app.engine('html', require('ejs').renderFile);
app.set("view engine", "html")
app.set("views", __dirname + "/views");
app.use("/public", express.static(__dirname + "/public"));


app.get("/", (req, res) => res.render("index.html") );
app.get("/*", (req, res) => res.redirect("/") );

app.listen(3000, "0.0.0.0", () => {
    console.log("asdf");
});