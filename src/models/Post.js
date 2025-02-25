const { v4: uuid4 } = require("uuid");

class Post {
    constructor(title, description, url, comments, likes) {
        this.id = uuid4();
        this.title = title;
        this.description = description;
        this.url = url;
        this.comments = comments;
        this.likes = likes;
    }
}

module.exports = Post;