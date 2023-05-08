// const { MongoClient, Binary } = require('mongodb'); 
const express = require("express");
const router = express.Router();
const PostsController = require("../controllers/posts");

const upload = require('../multerSetup')

router.get("/", PostsController.Index);
router.post("/", upload.single('img'), PostsController.Create)
router.get("/:ownerId", PostsController.GetPostOwnerData)
router.put("/:postId/like", PostsController.LikePost)
router.get("/:postId/likes", PostsController.LikePost)
router.delete("/", PostsController.Delete)


module.exports = router;
  