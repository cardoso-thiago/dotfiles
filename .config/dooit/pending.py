from dooit.api import Workspace, Todo, manager

def count_pending_tasks():
    manager.connect()

    query = Todo.all()
    pending_tasks = len([todo for todo in Todo.all() if todo.is_pending])
    overdue_tasks = len([todo for todo in Todo.all() if todo.is_overdue])

    if pending_tasks > 0:
        print(f"\033[38;2;250;179;135m{pending_tasks} tarefa(s) pendente(s).\033[0m")
        if overdue_tasks > 0:
            print(f"\033[38;2;224;108;117m{overdue_tasks} tarefa(s) vencida(s).\033[0m")

if __name__ == "__main__":
    count_pending_tasks()