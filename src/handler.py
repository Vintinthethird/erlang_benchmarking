from erlport.erlitems import Atom
from erlport.erlang import set_message_handler, cast

def register_handler(dest):
    def handler(message):
        cast(dest, message)
    set_message_handler(handler)
    return Atom("ok")

