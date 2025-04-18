const User = require("../models/userModel");

//Create User
exports.createUser = async(req, res) =>{
    try{
        const user = new User(req.body);
        //Store the User
        await user.save();

        res.status(201).json(user);
    }catch(error){
        res.status(400).json({error:error.message});
    }
};