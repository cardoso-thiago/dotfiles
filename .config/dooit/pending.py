from dooit.api import Workspace, Todo, manager

COLORS = {
    "yellow": "\033[38;2;250;179;135m",
    "red": "\033[38;2;224;108;117m",
    "reset": "\033[0m"
}

def count_pending_tasks():
    """Conta e exibe o total de tarefas pendentes e vencidas."""
    manager.connect()

    pending_tasks = len([todo for todo in Todo.all() if todo.is_pending])
    overdue_tasks = len([todo for todo in Todo.all() if todo.is_overdue])

    if pending_tasks > 0:
        print(f"{COLORS['yellow']}{pending_tasks} tarefa(s) pendente(s).{COLORS['reset']}")
        if overdue_tasks > 0:
            print(f"{COLORS['red']}{overdue_tasks} tarefa(s) vencida(s).{COLORS['reset']}")

if __name__ == "__main__":
    count_pending_tasks()
