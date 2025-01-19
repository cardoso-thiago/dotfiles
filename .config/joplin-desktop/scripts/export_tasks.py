import requests
import getpass

def get_folders(api_base_url, token):
    """Obtém a lista de cadernos."""
    response = requests.get(f"{api_base_url}/folders?token={token}")
    response.raise_for_status()
    return response.json()["items"]

def get_notes(api_base_url, folder_id, token):
    """Obtém as tarefas de um caderno específico com os campos id, title e body."""
    response = requests.get(f"{api_base_url}/folders/{folder_id}/notes?token={token}&fields=id,title,body")
    response.raise_for_status()
    return response.json()["items"]

def get_tags(api_base_url, note_id, token):
    """Obtém as tags associadas a uma nota específica."""
    response = requests.get(f"{api_base_url}/notes/{note_id}/tags?token={token}")
    response.raise_for_status()
    return [tag["title"] for tag in response.json()["items"]]

def export_to_markdown(api_base_url, token, folder_name, notes, include_full_content):
    """Exporta as tarefas para um arquivo Markdown."""
    if not include_full_content:
        folder_name += " (Apenas Títulos)"
    
    filename = f"{folder_name}.md"
    with open(filename, "w", encoding="utf-8") as file:
        file.write(f"# {folder_name}\n\n")
        for note in notes:
            file.write(f"- **{note['title']}**\n")
            
            if include_full_content:
                tags = get_tags(api_base_url, note["id"], token)
                if tags:
                    file.write(f"> **Tags: {', '.join(tags)}**\n")
                
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

    include_full_content = input("\nConteúdo completo? (s/n): ").strip().lower() != "n"

    try:
        notes = get_notes(api_base_url, selected_folder["id"], token)
    except requests.exceptions.RequestException as e:
        print(f"Erro ao obter tarefas: {e}")
        return

    if notes:
        export_to_markdown(api_base_url, token, selected_folder["title"], notes, include_full_content)
    else:
        print(f"O caderno '{selected_folder['title']}' não contém tarefas.")

if __name__ == "__main__":
    main()
