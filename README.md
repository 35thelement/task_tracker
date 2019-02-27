# TaskTracker

## Design Choices

### Users:
- **email:** This is the field that the users need to log in.
- **name:** I felt like having a name would be a nice personal touch in this very bare-bones app.

### Tasks:
- **name:** Users need to be able to enter a name for their task.
- **desc:** Users need to be able to enter a description for their task.

### Times:
- **minutes:** Users need to be able to describe how much time they've put into their tasks.

### Relationships Between Tables:
I decided to make a many-to-one relationship between the tasks and the users after a discussion with the professor. Initially, I wanted to make a many-to-many relationship between the two entities. However, the professor said that I only needed to implement the many-to-one relationship, but he said that if I wanted to, I could implement a many-to-many relationship. After running into several complications, I decided to implement the much easier many-to-one relationship.
