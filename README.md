# TaskTracker

## Design Choices

### Users:
- **email:** This is the field that the users need to log in.
- **name:** I felt like having a name would be a nice personal touch in this very bare-bones app.

### Tasks:
- **name:** Users need to be able to enter a name for their task.
- **desc:** Users need to be able to enter a description for their task.

### Times:
- **start and end:** Users need to be able to describe how much time they've put into their tasks.

### Relationships Between Tables:
I decided to make a many-to-one relationship between the tasks and the users after a discussion with the professor. Initially, I wanted to make a many-to-many relationship between the two entities. However, the professor said that I only needed to implement the many-to-one relationship, but he said that if I wanted to, I could implement a many-to-many relationship. After running into several complications, I decided to implement the much easier many-to-one relationship.
I created the time blocks table as a sort of join table between the users and tasks. This is due to the fact that a time block has to have a user, a task, and the start and stop time that the user worked on this task.
I chose a many-to-one relationship between users and bosses to make it easier to load the IDs of the users when assigning a task to a user. I also made the IDs visible in the users table so that users can determine who they are assigning a task to. I would have liked to load the names of users, but I was pressed for time.

### Assigning a Task to a Users
I created a function that queried the user table, given a user's id, that loads the user's id and the ids of all their direct subordinates, aka the users that have the user's id as their boss. In the form for creating a new task or editing a task, the function is used to populate a select field. This prevents a user from assigning a task to anyone other than themselves or their direct subordinates.

### Showing a User's Subordinates
I created another function that queried the user table, given a user's id, that loads the user and all the user's direct subordinates. I then used this function when showing a user by calling it on  the id of the user that is going to be shown. This list of subordinates is then filtered to remove the original user.

## Assigning a Subordinate to a User
I did this through editing a user's current boss when editing a user. There is a dropdown populated with all other users wherein a user can choose any user's boss.

### Creating a Time Block
When a user looks at a task, they can see two buttons: one to start working, and one to stop. When they click the start button, they store a local page variable as the starting time, which is set to the time they clicked the button. When a user clicks the stop button, an AJAX function sends a new time block to be added, with a start time equal to the previously stored start time and a stop time set to when  they clicked the stop button. When they press the stop button without pressing the start button, nothing happens.
