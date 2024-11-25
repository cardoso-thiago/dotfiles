from dooit.api import Workspace, Todo, manager
from datetime import datetime

COLORS = {
    "blue": "\033[38;2;130;170;255m",
    "green": "\033[38;2;166;227;161m",
    "yellow": "\033[38;2;250;179;135m",
    "red": "\033[38;2;224;108;117m",
    "reset": "\033[0m",
}

def format_date(due_date: datetime) -> str:
    return due_date.strftime("%d/%m/%Y") if due_date else ""

def display_workspace_tasks():
    manager.connect()

    workspaces = Workspace.all()
    if not workspaces:
        return

    for workspace in workspaces:
        todos = workspace.todos
        if not todos:
            continue

        print(f"{COLORS['blue']}{workspace.description}{COLORS['reset']}")

        for todo in todos:
            if not todo.is_pending:
                continue

            if todo.due:
                due_date = format_date(todo.due)
                if todo.is_overdue or todo.is_due_today():
                    color = COLORS["red"]
                else:
                    color = COLORS["yellow"]
                print(f"  {color}- {todo.description} ({due_date}){COLORS['reset']}")
            else:
                print(f"  {COLORS['green']}- {todo.description}{COLORS['reset']}")

if __name__ == "__main__":
    display_workspace_tasks()
