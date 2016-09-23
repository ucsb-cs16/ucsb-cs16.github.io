---
topic: "submit.cs"
desc: "Home grown UCSB CS autograder system"
---

submit.cs, online at <https://submit.cs.ucsb.edu> is a home-grown autograder system, developed by Bryce Boe as
part of his Ph.D. dissertation while he was a student at UCSB.

Reusing programming assignments that are already set up in submit.cs is relatively straightforward.

Constructing new programming assignments can be somewhat tedious, but is possible.

If you are using submit.cs, be advised that the system is currently somewhat on "life-support".     It works well, when it works---but
when it breaks, there is not a particularly good support infrastructure in place to take care of problems that arise.   Another way to say it is: 
it is supported by faculty members, and volunteers, not by dedicated support professionals.

There is a long-term plan to migrate to an autograder solution with a better support infrastructure and support team.   For the time being,
submit.cs support isn't great, but it may be the best we can do.


# Frequently Asked Questions from Instructors

1. Are students automatically signed up for a submit.cs account? One of my students yesterday said she was signed up.

Students sign for submit.cs with their `___@umail.ucsb.edu` email address.    If they have already used submit.cs for a previous course, they will already be signed up for it.    

(In the rare case of a student with no umail.ucsb.edu address, e.g. a Open University Extension student, then you must contact the submit.cs administrator to ask that person to create the acccount.  (currently: pconrad@cs.ucsb.edu).)

To sign up for submit.cs, they simply need to go to the website [submit.cs.ucsb.edu](https://submit.cs.ucsb.edu), and click on "Create Account".     

This, however, only puts them in the system&mdash;it does NOT put them in the course.  There is a second step they must do, which is that after they log in, they need to click the "Join Class" button, and then select the button for the course.  They only need to do this once per quarter, per class.


2. There's a couple of my TAs that I can't set up as admins - the system does not like their emails for some reason ("Invalid User" error).

The way to handle this is that the TA needs to sign up for submit.cs first, using the same procedure as the students&mdash;that is, to sign up with their umail address.    Once they have signed up for submit.cs, then any admin for the course should be able to add these TAs as additional admins.


3. I'd like to see how to create, from both scratch and an older existing lab, a new lab.

Creating a lab from scratch is a longer process than I can document quickly, but here is some quick documentation for the case of cloning an existing lab.

   1.  Click "Create New Project" as shown:
       ![click_create_new_project.png](click_create_new_project.png)
   1.  On lower half of screen: select which project to clone, give it a new name, and then click the button, as shown:
       ![clone_a_project_from_existing.png](clone_a_project_from_existing.png)
   1.  Click "Create New Project" as shown:
       ![result_of_clone.png](result_of_clone.png)


4. I want to know how grades get collected by the system and how my TAs or I can over-ride them.

Grades in submit.cs are the result of the test cases that are run.     Typically I don't override grades in submit.cs, but rather, if an override is needed, I do it in Gauchospace.  That invites the next question...

5. How do you get the grades computed by submit.cs out of submit.cs, and into another system, such as Gauchospace?
    I also want to know how to access the submitted .cpp files in case I/the TAs need to manually do the grading.

On the page for an assignment, there is a button to download the CSV file, as shown below.   There is also a button
to download a .zip file with all of the source code for all submissions.

![submit_cs_download_grades_or_source_code.png](submit_cs_download_grades_or_source_code.png)

Note that the submissions can also be browsed individually on the assignment page after navigating to a particular
student's submission, as shown here:

![click_to_see_source_code_contents.png](click_to_see_source_code_contents.png)
