from dooit.api import Workspace, Todo, manager

def list_todos(todo, level=0):
    indent = " " * level
    lines = [f"{indent}- [ ] {todo.description}"]
    for child_todo in todo.todos:
        lines.extend(list_todos(child_todo, level + 1))
    return lines

def export_workspace_todos():
    manager.connect()
    workspaces = Workspace.all()

    if not workspaces:
        print("Sem workspaces disponíveis.")
        return

    available_workspaces = [ws for ws in workspaces if ws.todos]

    if not available_workspaces:
        print("Nenhum workspace com tarefas disponível.")
        return

    print("Workspaces disponíveis:")
    for index, workspace in enumerate(available_workspaces):
        print(f"{index + 1}. {workspace.description}")

    selected_index = int(input("Selecione um workspace pelo número: ")) - 1

    if selected_index < 0 or selected_index >= len(available_workspaces):
        print("Seleção inválida")
        return

    selected_workspace = available_workspaces[selected_index]
    todos = selected_workspace.todos

    if not todos:
        print("Sem tarefas nesse workspace")
        return

    lines = [f"# Tarefas no Workspace '{selected_workspace.description}':", ""]
    for todo in todos:
        lines.extend(list_todos(todo))

    filename = f"{selected_workspace.description}.md"
    with open(filename, "w") as file:
        file.write("\n".join(lines))

    print(f"Tarefas escritas no arquivo {filename}")

if __name__ == "__main__":
    export_workspace_todos()
