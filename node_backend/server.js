const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const cors = require("cors");
const userRoutes = require("./routes/userRoute")

dotenv.config();

const app = express();

//Middlewares
app.use(cors());
app.use(express.json());
const PORT = process.env.PORT || 5000;

//Routes
app.use("/api", userRoutes);

//Connect to Db
mongoose.connect(process.env.MONGODB_URL).then(() => console.log("MongoDb Connected Successfully!")).catch((error) => console.log("MongoDb Connection Error: ", error));

//Start the Server
app.listen(PORT, () => {
    console.log(`Server is Running on Port ${PORT}`);
});
