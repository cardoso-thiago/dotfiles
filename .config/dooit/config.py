from dooit.ui.api import DooitAPI, subscribe
from dooit.ui.api.events import Startup
from dooit.api.theme import DooitThemeBase
from dooit.api import Todo
from datetime import datetime
from dooit_extras.formatters import *
from rich.style import Style
from rich.text import Text

@subscribe(Startup)
def dashboard_setup(api: DooitAPI, _):
    api.css.set_theme(CatppuccinMacchiato)
    api.dashboard.set(
        [
            "Bem vindo!",
            "",
            "Pressione '?' para ajuda.",
        ]
    )

    fmt = api.formatter
    fmt.todos.due.add(custom_due)
    # fmt.todos.due.add(due_danger_today())

    fmt.todos.status.add(status_icons(completed=" ", pending="󰞋 ", overdue="󰅗 "))

    u_icons = {1: "  󰎤", 2: "  󰎧", 3: "  󰎪", 4: "  󰎭"}
    fmt.todos.urgency.add(urgency_icons(icons=u_icons))

    fmt.todos.description.add(description_strike_completed())
    fmt.todos.description.add(description_children_count())
    fmt.todos.description.add(description_highlight_link())
    fmt.todos.description.add(todo_description_progress())
    
    # Key bindings
    api.keys.set(["j", "<down>"], api.move_down)
    api.keys.set(["k", "<up>"], api.move_up)
    api.keys.set(["<tab>", "<left>", "<right>"], api.switch_focus)
    api.keys.set(["i", "<enter>"], api.edit_description)
    
    # Default
    # api.keys.set("<tab>", api.switch_focus)
    # api.keys.set("j", api.move_down)
    # api.keys.set("k", api.move_up)
    # api.keys.set("i", api.edit_description)
    # api.keys.set("d", api.edit_due)
    # api.keys.set("r", api.edit_recurrence)
    # api.keys.set("e", api.edit_effort)
    # api.keys.set("a", api.add_sibling)
    # api.keys.set("z", api.toggle_expand)
    # api.keys.set("Z", api.toggle_expand_parent)
    # api.keys.set("gg", api.go_to_top)
    # api.keys.set("G", api.go_to_bottom)
    # api.keys.set("A", api.add_child_node)
    # api.keys.set("J", api.shift_down)
    # api.keys.set("K", api.shift_up)
    # api.keys.set("xx", api.remove_node)
    # api.keys.set("c", api.toggle_complete)
    # api.keys.set(["=", "+"], api.increase_urgency)
    # api.keys.set(["-", "_"], api.decrease_urgency)
    # api.keys.set("/", api.start_search)
    # api.keys.set("<ctrl+s>", api.start_sort)
    # api.keys.set("<ctrl+q>", api.quit)

def custom_due(due: datetime, model: Todo, fmt: str = "{}") -> str:
    if due is not None:
        if due.date() == datetime.today().date():
            return Text(
                fmt.format("Hoje"),
                style=Style(
                    color="#ED8796",
                    bold=True,
                ),
            ).markup
        return due.strftime("%d/%m/%Y")

class CatppuccinMacchiato(DooitThemeBase):
    _name = "dooit-catppuccin-macchiato"

    background1: str = "#24273A"
    background2: str = "#1E2030"
    background3: str = "#1A1C2A"

    foreground1: str = "#CAD3F5"
    foreground2: str = "#B8C0E0"
    foreground3: str = "#A5ADCB"

    red: str = "#ED8796"
    orange: str = "#F5A97F"
    yellow: str = "#EED49F"
    green: str = "#A6DA95"
    blue: str = "#8AADF4"
    purple: str = "#C6A0F6"
    magenta: str = "#F5BDE6"
    cyan: str = "#8BD5CA"

    primary: str = blue
    secondary: str = cyan