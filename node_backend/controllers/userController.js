const User = require("../models/userModel");

//Create User
exports.createUser = async (req, res) => {
    try {
        const user = new User(req.body);
        //Store the User
        await user.save();

        res.status(201).json(user);
    } catch (error) {
        res.status(400).json({ error: error.message });
    };
};

//Get All Users
exports.getAllUsers = async (req, res) => {
    try {
        const users = await User.find();
        if (!users) {
            return res.status(404).json({ message: "Users Not Found!" });
        } else {
            res.json(users);
        }
    } catch (error) {
        res.status(400).json({ error: error.message });
    };
};

//Get a Single User
exports.getSingleUser = async (req, res) => {
    try {
        const userId = req.params.id.trim();
        const user = await User.findById(userId);
        if (!user) {
            return res.status(404).json({ message: "User Not Found!" });
        } else {
            res.json(user);
        }
    } catch (error) {
        res.status(400).json({ error: error.message });
    };
};

//Update a User
exports.updateUser = async (req, res) => {
    try {
        const userId = req.params.id.trim();
        const user = await User.findByIdAndUpdate(userId, req.body, {
            new: true,
            runValidators: true,
        });
        if (!user) {
            return res.status(404).json({ message: "User Not Found!" })
        } else {
            res.json(user);
        }
    } catch (error) {
        res.status(400).json({ error: error.message });
    };
};

//Delete a User
exports.deleteUser = async (req, res) => {
    try {
        const userId = req.params.id.trim();
        const user = await User.findByIdAndDelete(userId);
        if (!user) {
            return res.status(404).json({ message: "User Not Found!" })
        } else {
            res.json({ message: "User Deleted Successfully!" });
        }
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};