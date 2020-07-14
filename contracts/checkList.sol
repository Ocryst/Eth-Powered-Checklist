pragma solidity ^0.5.16;

contract checkList {
  //declare state variable with initial value
  uint public taskCount = 0;
  //create state variable for tasks

  struct Task {
    uint id;
    string content;
    bool completed;
  }

  //allows you to access the blockchain database
  //creates uint of Tasks so each task has variables
  mapping(uint => Task) public tasks;

  event TaskCreated(uint id, string content, bool completed);
  event TaskCompleted(uint id, bool completed);

  constructor() public {
    createTask("Clean_Room");
  }

  //place the struct into the mapping via function
  function createTask(string memory _content) public {
    //change value by one
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false);
    //call task creation event
    emit TaskCreated(taskCount, _content, false);
  }

  //Check off Tasks
  function toggleCompleted(uint _id) public {
    //read task out of the mapping
    //want to declare variable of type Task out of memory
    Task memory _task = tasks[_id];
    //invert the boolean state
    //if false revert to true, if true revert to false
    _task.completed = !_task.completed;
    //lastly, put the task back into mapping with the completed flag.
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }
}
