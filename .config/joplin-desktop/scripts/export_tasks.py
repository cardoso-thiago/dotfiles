import requests
import getpass

def get_folders(api_base_url, token):
    """Obtém a lista de cadernos."""
    response = requests.get(f"{api_base_url}/folders?token={token}")
    response.raise_for_status()
    return response.json()["items"]

def get_notes(api_base_url, folder_id, token):
    """Obtém as tarefas de um caderno específico com os campos de title e body."""
    response = requests.get(f"{api_base_url}/folders/{folder_id}/notes?token={token}&fields=title,body")
    response.raise_for_status()
    return response.json()["items"]

def export_to_markdown(folder_name, notes):
    """Exporta as tarefas para um arquivo Markdown."""
    filename = f"{folder_name}.md"
    with open(filename, "w", encoding="utf-8") as file:
        file.write(f"# {folder_name}\n\n")
        for note in notes:
            file.write(f"- **{note['title']}**\n")
            if note.get("body"):
                for line in note["body"].splitlines():
                    file.write(f"> {line}\n")
                file.write("\n")
    print(f"Exportado para {filename}")

def main():
    api_base_url = "http://127.0.0.1:41184"
    token = getpass.getpass("Informe o token da API do Joplin: ").strip()

    try:
        folders = get_folders(api_base_url, token)
    except requests.exceptions.RequestException as e:
        print(f"Erro ao acessar a API: {e}")
        return

    if not folders:
        print("Nenhum caderno encontrado!")
        return

    print("\nCadernos disponíveis:")
    for idx, folder in enumerate(folders, start=1):
        print(f"{idx}. {folder['title']}")

    while True:
        try:
            choice = int(input("\nSelecione o número do caderno que deseja exportar: "))
            if 1 <= choice <= len(folders):
                selected_folder = folders[choice - 1]
                break
            else:
                print("Seleção inválida. Tente novamente.")
        except ValueError:
            print("Entrada inválida. Por favor, insira um número.")

    try:
        notes = get_notes(api_base_url, selected_folder["id"], token)
    except requests.exceptions.RequestException as e:
        print(f"Erro ao obter tarefas: {e}")
        return

    if notes:
        export_to_markdown(selected_folder["title"], notes)
    else:
        print(f"O caderno '{selected_folder['title']}' não contém tarefas.")

if __name__ == "__main__":
    main()
