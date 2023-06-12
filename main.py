import sys

from PyQt5.QtWidgets import QApplication, QWidget, QFileDialog, QLabel, QVBoxLayout


class App(QWidget):

    def __init__(self):
        super().__init__()
        self.title = 'PyQt5 File Chooser App'
        self.left = 10
        self.top = 10
        self.width = 640
        self.height = 480
        self.init_ui()

    def init_ui(self):
        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)

        self.layout = QVBoxLayout()
        self.label = QLabel("File selected: ??")

        self.layout.addWidget(self.label)
        self.setLayout(self.layout)

        self.open_filename_dialog()
        self.show()

    def open_filename_dialog(self):
        options = QFileDialog.Options()
        options |= QFileDialog.DontUseNativeDialog
        filename, _ = QFileDialog.getOpenFileName(self, "File Dialog example", "",
                                                  "All Files (*);;Python Files (*.py)", options=options)
        if filename:
            self.label.setText(filename)
            print(filename)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    sys.exit(app.exec_())
