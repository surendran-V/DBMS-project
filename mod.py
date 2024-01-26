import tkinter as tk
import mysql.connector
from tkinter import PhotoImage
import json

# Replace 'file_path.json' with your file's path
file_path = 'reviews.json'



# Function to display reviews in a popup
def display_reviews():
    dom = domain_var.get()
    subdom = subdomain_var.get()
    with open(file_path, 'r') as file:
        reviews = json.load(file)
    rev = ""
    if dom == "Internships":
        if subdom == "Tier 1":
            d = reviews["Internships"]["Tier 1"]
            rev  = rev + "Tier 1 Reviews\n\n"
            for key, value in d.items():
                rev = rev + str(key) + "\n\t" + str(value)
                
        elif subdom == "Tier 2":
            d = reviews["Internships"]["Tier 2"]
            rev  = rev + "Tier 2 Reviews\n\n"
            for key, value in d.items():
                rev = rev + str(key) + "\n\t" + str(value)
        else:
            d = reviews["Internships"]["Tier 3"]
            rev  = rev + "Tier 3 Reviews\n\n"
            for key, value in d.items():
                rev = rev + str(key) + "\n\t" + str(value)
                
    elif dom == "Stay":
        if subdom == "Hostel":
            d = reviews["Stay"]["Hostel"]
            rev  = rev + "Hostelites Reviews\n\n"
            for key, value in d.items():
                rev = rev + str(key) + "\n\t" + str(value)
                
        elif subdom == "PG":
            d = reviews["Stay"]["PG"]
            rev  = rev + "PG Reviews\n\n"
            for key, value in d.items():
                rev = rev + str(key) + "\n\t" + str(value)
        else:
            d = reviews["Stay"]["Day Scholar"]
            rev  = rev + "Day Scholar Reviews\n\n"
            for key, value in d.items():
                rev = rev + str(key) + "\n\t" + str(value)

    elif dom == "Club Genre":
        d = reviews["Club Genre"]
        rev  = rev + "Club Reviews\n\n"
        for key, value in d.items():
            rev = rev + str(key) + " Reviews\n"
            for key1,value1 in value.items():
                rev = rev + str(key1) + "\n\t" + str(value1)
        
    else:
        d = reviews["Courses"]
        rev  = rev + "Course Reviews\n\n"
        for key, value in d.items():
            rev = rev + str(key) + " Reviews\n"
            for key1,value1 in value.items():
                rev = rev + str(key1) + "\n\t" + str(value1)
        
    
    # Create a new Toplevel window for the reviews
    review_window = tk.Toplevel(root)
    review_window.title("Reviews")
    
    # Create a text widget to display the reviews
    review_text = tk.Text(review_window, height=75, width=300)
    review_text.pack(padx =  20,pady = 20)

    review_text.insert(tk.END, rev + "\n\n")
    
    # Disable editing in the text widget
    review_text.config(state=tk.DISABLED)




# ... (Your database connection code remains unchanged)
connection = mysql.connector.connect(
        host = 'localhost',
        user = 'root',
        password = 'surensuren123!',
        database = 'alumni'
    )
cursor = connection.cursor()

# Dictionary to hold submenu items for each domain
submenu_items = {
    "Club Genre": ["Miscellaneous","Public Speaking","Programming","Fine Arts","Music","Visual Arts","Athletics"],
    "Internships": ["Tier 1", "Tier 2", "Tier 3"],
    "Stay": ["Hostel", "PG", "Day Scholar"],
    "Courses": []  # Empty list for Courses
}

# ... (Your query and label update functions remain unchanged)
from PIL import Image, ImageTk


def lbl(dom,subdom):
    cursor = connection.cursor()
    text = ""
    if dom == "Internships":
        if subdom == "Tier 1":
            query = """SELECT a.alumni_name,i.company_name,i.pay,i.duration FROM alumni a JOIN internship i ON a.id = i.id JOIN company c ON i.company_name = c.company_name WHERE c.tier = 1;"""
        elif subdom == "Tier 2":
            query = """SELECT a.alumni_name,i.company_name,i.pay,i.duration FROM alumni a JOIN internship i ON a.id = i.id JOIN company c ON i.company_name = c.company_name WHERE c.tier = 2;"""
        else:
            query = """SELECT a.alumni_name,i.company_name,i.pay,i.duration FROM alumni a JOIN internship i ON a.id = i.id JOIN company c ON i.company_name = c.company_name WHERE c.tier = 3;"""
        cursor.execute(query)
        result = cursor.fetchall()
        text = "\n Search Result :\n\n"
        for i in result:
            text  = text+'\t'+ str(i[0])+" interned at "+ str(i[1])+" and received "+ str(i[2])+" for "+str(i[3])+"\n"

        content_label.config(text=f"{text}")

    elif dom == "Stay":
        where = ""
        if subdom == "Hostel":
            where = subdom
            desired_stype = subdom
        elif subdom == "PG":
            where = subdom
            desired_stype = subdom
        else:
            where = "Home"
            desired_stype = "Day-Scholar"
        query = f"""SELECT
                        a.id,
                        a.alumni_name,
                        s.expenditure
                    FROM
                        alumni a
                    JOIN
                        stay s ON a.id = s.id
                    WHERE
                        s.stype ="{desired_stype}";
                        """
        cursor.execute(query)
        result = cursor.fetchall()
        text = "\n Search Result :\n\n"
        for i in result:
            text  = text+ '\t'+str(i[1])+" commuted from "+where+" and had expenditure of about "+ str(i[2])+"\n"

        content_label.config(text=f"{text}")
    elif dom =="Club Genre":
        genre = ""
        if subdom =="Miscellaneous":
            genre = subdom
        elif subdom =="Public Speaking":
            genre = subdom
        elif subdom =="Programming":
            genre = subdom
        elif subdom =="Fine Arts":
            genre = subdom
        elif subdom =="Music":
            genre = subdom
        elif subdom =="Visual Arts":
            genre = subdom
        elif subdom =="Science":
            genre = subdom
        elif subdom =="Technology":
            genre = subdom
        elif subdom =="Athletics":
            genre = subdom
        query = f"""SELECT
                                a.id,
                                a.alumni_name,
                                j.club_name
                            FROM
                                alumni a
                            JOIN
                                joined j ON a.id = j.id
                            JOIN
                                club c ON j.club_name = c.club_name
                            WHERE
                                c.genre = "{genre}";
                        """
        cursor.execute(query)
        result = cursor.fetchall()
        text = "\n Search Result :\n\n"
        for i in result:
            text  = text+'\t'+ str(i[1])+" liked "+genre+" clubs and joined "+ str(i[2])+"\n"

        content_label.config(text=f"{text}")
    elif dom =="Courses":


        query = f"""SELECT
                        a.alumni_name,
                        c.course_name
                    FROM
                        alumni a
                    JOIN
                        enrols e ON a.id = e.id
                    JOIN
                        course c ON e.course_id = c.course_id;
                        """
        cursor.execute(query)
        result = cursor.fetchall()
        text = "\n Search Result :\n\n"
        j = 0
        while j < 10:
            i  = result[j]
            text  = text+'\t'+ str(i[0])+" enroled "+"  in "+ str(i[1])+"\n"
            j+=1

        content_label.config(text=f"{text}")
    cursor.close()

def view_reviews():
    pass

def show_subdomains():
    selected_domain = domain_var.get()
    subdomains = submenu_items.get(selected_domain, [])
    subdomain_var.set("")  # Clear selection
    subdomain_label.config(text="Choose SubDomain")  # Update label
    for widget in subdomain_frame.winfo_children():
        if widget != subdomain_label:  # Prevent deletion of label
            widget.destroy()  # Clear previous widgets
    for subdomain in subdomains:
        tk.Radiobutton(subdomain_frame, text=subdomain, variable=subdomain_var, value=subdomain, bg="#EFEFEF", anchor=tk.W, justify=tk.LEFT, indicatoron=0, padx=10, pady=5).pack(fill=tk.X)

def change_label_content():
    global dom, subdom
    dom = domain_var.get()
    subdom = subdomain_var.get()
    content_label.config(text=f"Content for {subdom}")
    lbl(dom, subdom)

root = tk.Tk()
root.title("AlumniConnect")
root.geometry("400x300")
root.configure(bg="gray")
original_image = Image.open("final_logo.jpg")  # Replace 'final_logo.jpg' with your image file path

# Define the desired width and height for the image
desired_width = 300
desired_height = 125

# Resize the image without using ANTIALIAS
resized_image = original_image.resize((desired_width, desired_height))

# Convert the resized image for Tkinter
tk_image = ImageTk.PhotoImage(resized_image)
logo_frame = tk.Frame(root, bd=2, relief=tk.GROOVE, bg="white")
logo_frame.place(x=0, y=0, width=1550, height=150)  # Manually position and set size
# Create a label to display the image with fixed size
logo_label = tk.Label(logo_frame, image=tk_image, width=desired_width, height=desired_height,bg = "white")
logo_label.place(x=550, y=10)

# Frame for domain selection
frame = tk.Frame(root, bd=2, relief=tk.GROOVE, bg="#EFEFEF")
frame.place(x=80, y=160, width=400, height=280)  # Manually position and set size

# Label for domain
label = tk.Label(frame, text="Choose Domain", font=("Arial", 12), fg="black", bg="#EFEFEF")
label.pack(pady=20)

# Variable for domain selection
domain_var = tk.StringVar(value="Club Genre")
for domain in submenu_items.keys():
    tk.Radiobutton(frame, text=domain, variable=domain_var, value=domain, command=show_subdomains, bg="#EFEFEF").pack(padx=10, anchor=tk.CENTER)

# Frame for subdomain selection
subdomain_frame = tk.Frame(root, bd=2, relief=tk.GROOVE, bg="#EFEFEF")
subdomain_frame.place(x=80, y=480, width=400, height=300)  # Manually position and set size

# Label for subdomain selection
subdomain_label = tk.Label(subdomain_frame, text="Choose SubDomain", font=("Arial", 12), fg="black", bg="#EFEFEF")
subdomain_label.pack(pady=20)

# Variable for subdomain selection
subdomain_var = tk.StringVar()

# Display radiobuttons for default domain ("Club Genre")
show_subdomains()

# Button to change content label
change_button = tk.Button(root, text="Show Results", command=change_label_content, font=("Arial", 12), bg="#FF0000", fg="white")
change_button.place(x=220, y=790, width=120, height=40)  # Manually position and set size

# Label for content
content_label = tk.Label(root, text="", font=("Segoe Print", 12), bg="white", fg="black", justify=tk.LEFT,anchor='nw')
content_label.place(x=570, y=160, width=800, height=500)  # Manually position and set size
content_label.pack_propagate(True)

#show reviews button

reviews_button = tk.Button(root, text="View Reviews", command=display_reviews, font=("Arial", 12), bg="darkblue", fg="white")
reviews_button.place(x=900, y=710, width=120, height=40)  # Manually position and set size
#fram for logo
# Frame for logo 

#logo
logo_label = tk.Label(logo_frame)
logo_label.pack()
# Variables to store domain and subdomain
dom = ""
subdom = ""

root.mainloop()
