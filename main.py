import tkinter as tk
from PIL import Image, ImageTk
from tkinter import messagebox
import mysql
import mysql.connector
from tkinter import PhotoImage
import json

file_path = 'reviews.json'

host = 'localhost'
user = 'root'
password = 'surensuren123!'
database = 'alumni'

original_image = Image.open("final_logo.jpg") 


submenu_items = {
    "Club Genre": ["Miscellaneous","Public Speaking","Programming","Fine Arts","Music","Visual Arts","Athletics"],
    "Internships": ["Tier 1", "Tier 2", "Tier 3"],
    "Stay": ["Hostel", "PG", "Day Scholar"],
    "Courses": []  # Empty list for Courses
}


connection = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )
cursor = connection.cursor()
srns = ["PES2UG21CS091", 'PES2UG21CS094', 'PES2UG21CS097', 'PES2UG21CS100', 'PES2UG21CS103', 'PES2UG21CS106', 'PES2UG21CS109', 'PES2UG21CS112', 'PES2UG21CS115', 'PES2UG21CS118','p']
root = tk.Tk()
root.title("AlumniConnect")
root.configure(bg="#F5F5F5")
desired_width = 300
desired_height = 125
resized_image = original_image.resize((desired_width, desired_height))

def admin():
    global cursor, connection
    
    while True:
        try:
            srn = str(input("Enter your SRN: "))
            name = str(input("Enter your Name: "))
            yog = str(input("Enter your Graduation Year: "))
            gender = str(input("Enter your gender: "))

            # SQL query to insert data into the alumni table
            insert_query = "INSERT INTO alumni (id, alumni_name, year_of_grad, gender) VALUES (%s, %s, %s, %s)"
            values = (srn, name, yog, gender)

            # Execute the query and commit changes
            cursor.execute(insert_query, values)
            connection.commit()
            print("Record inserted successfully!")
            
            retry = input("Do you want to insert more records? (yes/no): ").lower()
            if retry != 'yes':
                break  # Exit the loop if the user doesn't want to insert more records

        except mysql.connector.Error as err:
            print(f"Error: {err}")
            connection.rollback()  # Rollback the transaction in case of an error
def run(new_window):
    tk_image = ImageTk.PhotoImage(resized_image)
    logo_frame = tk.Frame(new_window, bd=2, relief=tk.GROOVE, bg="white")
    logo_frame.place(x=0, y=0, width=1550, height=150)  # Manually position and set size
    # Create a label to display the image with fixed size
    global desired_width,desired_height
    label1 = tk.Label(logo_frame,text = "ALUMNI CONNECT",font=("Cooper Black", 30), fg="black", bg="#BDFCC9")
    label1.place(x=0, y=0, width = 1550, height = 150,)

    # Frame for domain selection
    frame = tk.Frame(new_window, bd=2, relief=tk.GROOVE, bg="#BDFCC9")
    frame.place(x=80, y=160, width=400, height=280)  # Manually position and set size

    # Label for domain
    label = tk.Label(frame, text="Choose Domain", font=("Arial", 12), fg="black", bg="#F5F5DC")
    label.pack(pady=20)

    # Variable for domain selection
    global domain_var
    domain_var = tk.StringVar(value="Club Genre")
    for domain in submenu_items.keys():
        tk.Radiobutton(frame, text=domain, variable=domain_var, value=domain, command=show_subdomains, bg="#F5F5DC").pack(padx=10, anchor=tk.CENTER)

    # Frame for subdomain selection
    global subdomain_frame
    subdomain_frame = tk.Frame(new_window, bd=2, relief=tk.GROOVE, bg="#BDFCC9")
    subdomain_frame.place(x=80, y=480, width=400, height=300)  # Manually position and set size

    # Label for subdomain selection
    global subdomain_label
    subdomain_label = tk.Label(subdomain_frame, text="Choose SubDomain", font=("Arial", 12), fg="black", bg="#F5F5DC")
    subdomain_label.pack(pady=20)

    # Variable for subdomain selection
    global subdomain_var
    subdomain_var = tk.StringVar()

    # Display radiobuttons for default domain ("Club Genre")
    show_subdomains()

    # Button to change content label
    change_button = tk.Button(new_window, text="Show Results", command=change_label_content, font=("Arial", 12), bg="#FF0000", fg="white")
    change_button.place(x=220, y=790, width=120, height=40)  # Manually position and set size

    # Label for content
    global content_label
    content_label = tk.Label(new_window, text="", font=("Arial", 12), bg="white", fg="black", justify=tk.LEFT,anchor='nw')
    content_label.place(x=570, y=160, width=800, height=500)  # Manually position and set size
    content_label.pack_propagate(True)

    #show reviews button

    reviews_button = tk.Button(new_window, text="View Reviews", command=display_reviews, font=("Arial", 12), bg="darkblue", fg="white")
    reviews_button.place(x=900, y=710, width=120, height=40)  # Manually position and set size
    
    # Variables to store domain and subdomain
    dom = ""
    subdom = ""












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
        (
            SELECT
                s.expenditure
            FROM
                stay s
            WHERE
                s.id = a.id AND s.stype = "{desired_stype}"
            LIMIT 1
        ) AS expenditure
        FROM
        alumni a
        WHERE EXISTS (
        SELECT 1
        FROM stay s2
        WHERE s2.id = a.id AND s2.stype = "{desired_stype}"
        )
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
        query = f"""
            SELECT
        a.id,
        a.alumni_name,
        j.club_name
        FROM
        alumni a
        JOIN
        (
            SELECT
                j1.id,
                j1.club_name
            FROM
                joined j1
            JOIN
                club c1 ON j1.club_name = c1.club_name
            WHERE
                c1.genre = "{genre}"
        ) j ON a.id = j.id
        JOIN
        club c ON j.club_name = c.club_name
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

def display_reviews():
    global domain_var,subdomain_var
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
            print("\n")
        
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
    review_window.configure(bg="#F5F5DC")
    
    # Create a text widget to display the reviews
    review_text = tk.Text(review_window, height=20, width=110,bg="#BDFCC9",font=("Arial", 12))
    review_text.place(x=40,y=75)

    review_text.insert(tk.END, rev + "\n\n")
    
    # Disable editing in the text widget
    review_text.config(state=tk.DISABLED)




global username
global pwd
def login():
    username = username_entry.get()
    pwd = password_entry.get()

    # Validation logic (replace with your authentication process)
    if username in srns and pwd == username:
        if username == 'admin' and pwd == 'admin':
            admin()
            
        else:
            messagebox.showinfo("Login Successful", "Welcome, " + username + "!") 
            open_new_window()  # Call function to open new window after successful login
    else:
        messagebox.showerror("Login Failed", "Invalid username or password")
def open_new_window():
    new_window = tk.Toplevel()
    new_window.title("New Window")
    new_window.geometry("300x200")
    new_window.configure(bg="#F5F5DC")

    # Add widgets or content to the new window
    run(new_window)
    
def resize_image(event):
    new_width = event.width
    new_height = event.height
    resized_image = original_image.resize((new_width, new_height))
    new_image = ImageTk.PhotoImage(resized_image)
    canvas.itemconfig(background_label, image=new_image)
    canvas.image = new_image  # Keep a reference to the image

def show_subdomains():
    global domain_var,subdomain_var
    selected_domain = domain_var.get()
    subdomains = submenu_items.get(selected_domain, [])
    subdomain_var.set("")  # Clear selection
    subdomain_label.config(text="Choose SubDomain")  # Update label
    for widget in subdomain_frame.winfo_children():
        if widget != subdomain_label:  # Prevent deletion of label
            widget.destroy()  # Clear previous widgets
    for subdomain in subdomains:
        tk.Radiobutton(subdomain_frame, text=subdomain, variable=subdomain_var, value=subdomain, bg="#F5F5DC", anchor=tk.W, justify=tk.LEFT, indicatoron=0, padx=10, pady=5).pack(fill=tk.X)

def change_label_content():
    global dom, subdom
    dom = domain_var.get()
    subdom = subdomain_var.get()
    content_label.config(text=f"Content for {subdom}")
    lbl(dom, subdom)

# Load your image
image_path = "bg.jpg"  # Replace with your image's path
original_image = Image.open(image_path)
initial_width, initial_height = original_image.size

# Create a canvas that fills the window
canvas = tk.Canvas(root, width=initial_width, height=initial_height)
canvas.pack(fill="both", expand=True)

# Resize the image to fit the initial window size
resized_image = original_image.resize((initial_width, initial_height))
background_image = ImageTk.PhotoImage(resized_image)

# Create a background image on the canvas
background_label = canvas.create_image(0, 0, anchor="nw", image=background_image)

# Bind the resize event to the canvas
canvas.bind("<Configure>", resize_image)

# Create a frame for the login form
form_frame = tk.Frame(root, padx=20, pady=20, bg="white", width=400, height=150, highlightthickness=3, highlightcolor="#00868B", highlightbackground="#00868B")  # Adjust width and height as needed

# Center the form in the window
x_pos = (root.winfo_screenwidth() - form_frame.winfo_reqwidth()) // 2
y_pos = (root.winfo_screenheight() - form_frame.winfo_reqheight()) // 3
form_frame.place(x=x_pos, y=y_pos)

# Widgets for the login form with modified appearance
form_label = tk.Label(form_frame, text="Sign In", font=("Arial", 20, "bold"), fg="#00868B", bg="white")
form_label.pack(pady=10)

username_label = tk.Label(form_frame, text="Username:", fg="#00868B", bg="white", font=("Arial", 14))
username_label.pack()
username_entry = tk.Entry(form_frame, width=30, font=("Arial", 12), bd=2, relief=tk.GROOVE, highlightcolor="#00868B")
username_entry.pack(pady=5)

# Customizing border color for username entry widget
username_entry.config(highlightbackground="#00868B", highlightcolor="#00868B")

password_label = tk.Label(form_frame, text="Password:", fg="#00868B", bg="white", font=("Arial", 14))
password_label.pack()
password_entry = tk.Entry(form_frame, show="*", width=30, font=("Arial", 12), bd=2, relief=tk.GROOVE, highlightcolor="#00868B")
password_entry.pack(pady=5)

# Customizing border color for password entry widget
password_entry.config(highlightbackground="#00868B", highlightcolor="#00868B")

login_button = tk.Button(form_frame, text="Login", command=login, width=20, bg="#FF0000", fg="white", font=("Arial", 12, "bold"))
login_button.pack(pady=10)

root.mainloop()
connection.close()
