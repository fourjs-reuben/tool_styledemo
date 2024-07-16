# tool_styledemo
Prposed new demo program that can be used to test all widget attributes and presentation styles and what impact they on appearance of a form item

To run, on left hand side you would be expected to select Widget, Container, Dialog and then based on values entered, you would then select and enter possible widget attribute values, possible presentation style values.  On the right hand side you would see the resultant .4gl, .per, .4st.  You can then click GO to see the impact of what you have entered on a running Genero program.

Benefits are for developers to quickly see what differences the various widget attributes and presentation styles have on appearance.

By using the import/export, examples can be shared between developers, other developers and support personnel.

Internally the program operators by creating an in-memory SQLite database with all the possible values.  As the user selects valuues, autocompletion is used to select legal values.  A .4gl, .per and .4st is then generated  and the program is run.

Screenshot showing widget attributes being entered

<img width="1840" alt="Screenshot 2024-07-16 at 5 43 14 PM" src="https://github.com/user-attachments/assets/ff1c5c2a-b67c-4eb4-808c-73c562d0c340">

Screenshow showing common presentation style attributes being entered

<img width="1840" alt="Screenshot 2024-07-16 at 5 44 30 PM" src="https://github.com/user-attachments/assets/438d1e82-73cd-4c7a-829a-ad9db04aee46">

Running program

<img width="1840" alt="Screenshot 2024-07-16 at 5 44 35 PM" src="https://github.com/user-attachments/assets/22883124-6f16-49e8-98da-d7c97a39a121">

Note:

The .gitignore has a few extra files.  These are the files that are generated when the test program is run

In the code, I have used TODO to indicate where changes can be made

In the code there is a comment with a link to the documentation of the change

Initial commit has implemented
EDIT (hard-doded) in a GRID (hard-coded) using an INPUT (hard-coded) with its attributes and common presentation style attributes
