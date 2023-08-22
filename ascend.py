import tkinter as tk
from tkinter import ttk, filedialog, messagebox
import csv

class Application(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Employment Agency Data Importer")
        self.geometry("800x600")

        self.create_widgets()

    def create_widgets(self):
        self.btn_import = tk.Button(self, text="Import CSV", command=self.import_csv)
        self.btn_import.pack(pady=20)

        self.tree = ttk.Treeview(self, columns=('Agency', 'Address', 'Website', 'Telephone', 'Note', 'Complete'))
        self.tree.pack(pady=20)
        self.tree.heading('Agency', text='Employment Agency Name')
        self.tree.heading('Address', text='Physical Address')
        self.tree.heading('Website', text='Website Address')
        self.tree.heading('Telephone', text='Telephone')
        self.tree.heading('Note', text='Notes')
        self.tree.heading('Complete', text='Complete')

        self.tree.column('Agency', width=150)
        self.tree.column('Address', width=150)
        self.tree.column('Website', width=150)
        self.tree.column('Telephone', width=100)
        self.tree.column('Note', width=100)
        self.tree.column('Complete', width=70)

        self.tree.bind('<Double-1>', self.on_item_double_click)

        # Add an Entry widget for Notes, Checkbutton for Complete, and a Save button for each selected row
        self.note_entry = tk.Entry(self)
        self.check_var = tk.BooleanVar()
        self.check_complete = tk.Checkbutton(self, text="Complete", variable=self.check_var)
        self.save_button = tk.Button(self, text="Save", command=self.save_data)

    def on_item_double_click(self, event):
        # Ensure there's a selected item first
        if not self.tree.selection():
            return
        # Get the clicked item
        item = self.tree.selection()[0]
        # Get the clicked item
        item = self.tree.selection()[0]
        # Place the Entry and Checkbutton near the clicked item's row
        x, y, _, _ = self.tree.bbox(item, 'Note')
        self.note_entry.place(x=x, y=y, width=self.tree.column('Note', 'width'))
        x, y, _, _ = self.tree.bbox(item, 'Complete')
        self.check_complete.place(x=x, y=y)
        self.save_button.place(x=x+100, y=y-10)
        # Populate the Entry and Checkbutton based on the item's current values
        self.note_entry.delete(0, tk.END)
        self.note_entry.insert(0, self.tree.item(item, 'values')[4])
        self.check_var.set(True if self.tree.item(item, 'values')[5] == 'Yes' else False)

    def save_data(self):
        item = self.tree.selection()[0]
        self.tree.item(item, values=(self.tree.item(item, 'values')[0],
                                     self.tree.item(item, 'values')[1],
                                     self.tree.item(item, 'values')[2],
                                     self.tree.item(item, 'values')[3],
                                     self.note_entry.get(),
                                     'Yes' if self.check_var.get() else 'No'))
        # Hide the Entry, Checkbutton, and Save button
        self.note_entry.place_forget()
        self.check_complete.place_forget()
        self.save_button.place_forget()

    def import_csv(self):
        file_path = filedialog.askopenfilename(title="Open CSV", filetypes=[("CSV files", "*.csv")])
        if not file_path:
            return

        with open(file_path, 'r') as file:
            csvreader = csv.reader(file)
            next(csvreader)  # skip the header

            for row in csvreader:
                # Assuming each row in the CSV is structured as: Agency, Address, Website, Telephone
                self.tree.insert('', 'end', values=(row[0], row[1], row[2], row[3], '', ''))

app = Application()
app.mainloop()
