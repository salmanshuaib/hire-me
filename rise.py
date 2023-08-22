import tkinter as tk
from tkinter import ttk
from tkinter import filedialog
import csv

class EmploymentApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Employment Agencies")
        
        # Create and place a table
        self.tree = ttk.Treeview(self.root, columns=("Name", "Address", "Website", "Telephone"))
        self.tree.heading("#1", text="Name")
        self.tree.heading("#2", text="Address")
        self.tree.heading("#3", text="Website")
        self.tree.heading("#4", text="Telephone")
        self.tree.pack()
        
        # Create and place entry fields
        self.entry_fields = []
        for _ in range(22):
            entry = tk.Entry(self.root)
            entry.pack()
            self.entry_fields.append(entry)
        
        # Create and place note-taking space
        self.note_entry = tk.Text(self.root, height=5, width=40)
        self.note_entry.pack()
        
        # Create and place checkboxes
        self.complete_var = tk.IntVar()
        self.complete_check = tk.Checkbutton(self.root, text="Complete", variable=self.complete_var)
        self.complete_check.pack()
        
        # Create buttons
        self.import_button = tk.Button(self.root, text="Import CSV", command=self.import_csv)
        self.import_button.pack()
        
        self.save_button = tk.Button(self.root, text="Save", command=self.save_notes)
        self.save_button.pack()
        
    def import_csv(self):
        file_path = filedialog.askopenfilename(filetypes=[("CSV Files", "*.csv")])
        if file_path:
            with open(file_path, "r") as file:
                csv_reader = csv.DictReader(file)
                for row in csv_reader:
                    name = row["Employment Agency Name"]
                    address = row["Physical Address"]
                    website = row["Website Address"]
                    telephone = row["Telephone"]
                    self.tree.insert("", "end", values=(name, address, website, telephone))
                    for entry, header in zip(self.entry_fields, row.keys()):
                        entry.delete(0, tk.END)
                        entry.insert(0, row[header])
    
    def save_notes(self):
        selected_item = self.tree.selection()
        if selected_item:
            notes = self.note_entry.get("1.0", "end-1c")
            complete = self.complete_var.get()
            self.tree.set(selected_item, "#5", notes)
            self.tree.set(selected_item, "#6", complete)

if __name__ == "__main__":
    root = tk.Tk()
    app = EmploymentApp(root)
    root.mainloop()
