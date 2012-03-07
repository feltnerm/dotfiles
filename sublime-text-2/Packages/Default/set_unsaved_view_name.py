import sublime, sublime_plugin
import os.path
import string

class SetUnsavedViewName(sublime_plugin.EventListener):
    setting_name = False

    dropped_chars = string.whitespace + string.punctuation

    def on_modified(self, view):
        if view.file_name() or view.is_loading():
            return

        if self.setting_name:
            return

        cur_name = view.settings().get('auto_name')
        if cur_name and cur_name != view.name():
            return

        line = view.line(0)
        if line.size() > 50:
            line = sublime.Region(0, 50)

        first_line = view.substr(line)

        if (len(first_line) > 1 and first_line[0:2] == "#!"
                or len(first_line) > 7 and first_line[0:8] == "#include"):
            first_line = ""

        first_line = first_line.strip(self.dropped_chars)

        self.setting_name = True
        view.set_name(first_line)
        self.setting_name = False

        view.settings().set('auto_name', first_line)
