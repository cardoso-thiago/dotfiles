from dooit.api import Workspace, Todo, manager

def count_pending_todos():
    manager.connect()

    query = Todo.all()
    pending_todos = [todo for todo in query if todo.is_pending]

    return len(pending_todos)

if __name__ == "__main__":
    print(f"Tarefas pendentes: {count_pending_todos()}")