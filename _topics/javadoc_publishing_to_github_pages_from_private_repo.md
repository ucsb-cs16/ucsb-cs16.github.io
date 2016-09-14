---
topic: "javadoc: publishing to github pages from a private repo"
desc: "step-by-step instructions"
---

Github offers convenient free web hosting via a service called "github pages" for sites that are
* open source, and 
* contain only static html, css and javascript.   

All you have to do is create a separate branch called `gh-pages`, and
push to it.  You can even change the default branch from `master` to
`gh-pages`, so that you really don't have to think about branches
much, except during the initial setup of the repo.

All of that that works perfectly for javadoc, at least for public
repos.

<div markdown="1" style="float:right; width:780px" >
![example of creating private repo](images/create_lab00_javadoc_jgaucho_50.png) 
</div>

However, if our main repo is private, there's a problem: you can't
publish to github pages from a private repo.

So, our solution will be to create a separate public repo,
side-by-side with our private one.  Here's how to do it:

# Step 1: Set up public repo

Set up a public repo with a name that is similar to, but different from the private repo.  You might simply
add `javadoc` into the name.  For example, if our private repo is `lab00_jgaucho`, we'll create a
public repo `lab00_javadoc_jgaucho` (as shown in the example at right.)

The repo doesn't need a `.gitignore`, but do give it a `README.md` to make it easier to clone.  

<div style="clear:both;">&nbsp;</div>

<div markdown="1" style="float:right; width:780px" >
![create-gh-pages-from-master.png](images/create-gh-pages-from-master-50.png)
</div>

# Step 2: Make gh-pages the default branch of the public repo

Next, we'll set up the public repo to publish to the web.

This involves creating a second branch, in addition to the `master` branch.  By convention, github will try to create publish a website with any branch of a github.com public repo with the special name `gh-pages`.   

There is more than one way to do this, but by far the *easiest* is to do it *before* you clone the repo, directly
in the github.com web page.

Follow this sequence of steps as guided by the images at right.

(a) Find the drop down box for the master branch, left hand side near top.

(b) Click on it, and enter `gh-pages` to create a `gh-pages` branch from the `master` branch.

<div style="clear:both;" />
<div markdown="1" style="float:right; width:780px;" >
![Click on Settings](images/click_settings_50.png)
</div>

(c) Now that the `gh-pages` branch has been created, we will make it the default branch.  Click Settings near the
    upper right hand side of the page.  Note that this is the Settings for *this specific repo*, not
    your github account Settings.

<div style="clear:both;" />
<div markdown="1" style="float:right; width:780px; clear:both;" >
![Click on Branches](images/side_menu_select_branches_50.png)
</div>

(d) In the Settings menu that comes up at left, select Branches

<div style="clear:both;" />
<div markdown="1" style="float:right; width:780px;">
![Click on default branch selector where master is showing](images/change_default_branch_master_is_showing-50.png)
![Select gh-pages instead](images/change_default_branch_gh_pages_is_checked-50.png)
</div>

(e) On the page that comes up, find the section for Default Branch.   Select the drop-down box where it indicates
    `master`, and change it to `gh-pages`.

<div style="clear:both;" />
<div markdown="1" style="float:right; width:780px; clear:both;" >
![Are you sure you want to change the default branch?](images/change_default_branch_are_you_sure_50.png)
</div>

(f) When the scary red box comes up, indicate "Yes" that you really do want to do this.

<div style="clear:both;" />

# Step 3: Test it out with some web content.

To see if it is working, we can put a small test file, `hello.html` in the public repo on the gh-pages
branch.

Here is a minimalist (yet still 100% HTML 5 standards compliant) `hello.html` file.   Create this
in the gh-pages repo (you can do this directly in the github.com interface by clicking on "Create File",
and copy/pasting in this content:

<div markdown="1" style="float:right; width:780px; clear:both;" >
![hello.html](images/hello.html_50.png)
</div>

```
<!DOCTYPE html>
<html>
 <head>
  <title>Test document</title>
 </head>
 <body>
  <h1>Hello, World!</h1>
 </body>
</html>
```


Once you have committed this file your repo on the gh-pages branch, you should be able to navigate to
this web address to see the content, as shown at right.

* If the repo is <http://github.com/UCSB-CS56-M16/lab00_javadoc_jgaucho>, the web content will be at
  <http://UCSB-CS56-M16.github.io/lab00_javadoc_jgaucho>.   
* So to bring up the hello.html file, enter
  this in your browser: <http://UCSB-CS56-M16.github.io/lab00_javadoc_jgaucho/hello.html>.  You should
  see your web page.  To make sure that it is yours you are seeing ( and not mine), modify the content
  (change it from `Hello, World!`, to `Hello, Kitty!`, or `Hello, Dr. Nick!`, or whatever.)

* If you don't, check that the followed the instructions above. If you still can't figure it out,
  ask your instructional staff for assistance via Piazza.

Now that we have a public repo set up properly to publish web content via Github Pages, we can
set up our ant build.xml file to copy content into that repo.

<div style="clear:both;" />

# Step 4: Clone the public repo as a *sibling* of the private repo

To simplify the steps of publishing, we'll put the two repos
*side-by-side* in the same parent directory.  This *side-by-side* part
is *crucial*, so read these instructions carefully

* You need to clone them both in the same parent directory (e.g. `~/cs56`, or `/Users/JoGaucho/github`, or whatever)
* You should see the two directories/folders side by side in the same parent directory/folder
* That way, we can use a relative path from with the private repo's directory  to access the public repo's files, for example, `../lab00_javadoc_jgaucho` as we demonstrate in the next step.

Here's what that should look like.  Note that in the `git status` step, it notes that we are on the `gh-pages` branch instead of the `master` branch.

```
-bash-4.3$ pwd
/cs/faculty/pconrad/cs56
-bash-4.3$ ls
lab00_jgaucho
-bash-4.3$ git clone git@github.com:UCSB-CS56-M16/lab00_javadoc_jgaucho.git
Cloning into 'lab00_javadoc_jgaucho'...
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (6/6), done.
Checking connectivity... done.
-bash-4.3$ ls
lab00_javadoc_jgaucho  lab00_jgaucho
-bash-4.3$ cd lab00_javadoc_jgaucho/
-bash-4.3$ git status
On branch gh-pages
Your branch is up-to-date with 'origin/gh-pages'.
nothing to commit, working directory clean
-bash-4.3$ 
```


# Step 5: Modify `javadoc` target in private repo 

In this step, we add a `property` definiton to your `build.xml` that
defines a property called `javadoc_dest`.

Properties in ant `build.xml` files are similar to the assignments
statements we see in Makefiles (e.g. `CXX=g++` or `CXX=clang`)

Traditionally, property definitions are put at the top of the
build.xml, indented just after the opening `<project>` tag.  However,
in the cs56-rational-example, at [ex08/build.xml line
51](https://github.com/UCSB-CS56-M16/cs56-rational-example/blob/master/ex08/build.xml#L51),
we see that we've added a property that is only used in the `javadoc`
target immediately before the target.  We'll add our second property
there.  It will look like this. Note that you *will have to replace
`yourgithubid* with your own*.  I'm showing both the property you
should already have, plus the new one.

```xml
  <property name="javadoc_absolute_path" location="javadoc"/>
  <property name="public_javadoc_absolute_path" location="../lab00_javadoc_yourgithubid/javadoc"/>
```

Now that we have this, we can modify our javadoc target as follows:

Before:

```xml
<target name="javadoc" depends="compile" description="generate javadoc">
    <delete>
      <fileset dir="javadoc" />
    </delete>
    <javadoc destdir="javadoc">
      <fileset dir="src" >
	<include name="*.java"/>
      </fileset>
      <classpath refid="project.class.path" />
      <link href="http://docs.oracle.com/javase/8/docs/api/" />          
    </javadoc>
    <echo>
      javadoc written to file://${javadoc_absolute_path}/index.html
    </echo> 
  </target>
```

We'll make three changes:
* We change the `<link href=...` to use `https` instead of `http`.  Otherwise, links to the Oracle javadoc won't load due to http/https conflict (unless you open them in another page).
* We add one line to the `echo` task with a message that we are copying the javadoc to another directory
* We add some additional lines after that to copy the files to that other directory, and then give a message
    that we need to push those changes to github.

After: 

``` xml
<target name="javadoc" depends="compile" description="generate javadoc">
    <delete>
      <fileset dir="javadoc" />
    </delete>
    <javadoc destdir="javadoc">
      <fileset dir="src" >
	      <include name="*.java"/>
      </fileset>
      <classpath refid="project.class.path" />
      <link href="https://docs.oracle.com/javase/8/docs/api/" />          
    </javadoc>
    <echo>                                                                                       
      javadoc written to file://${javadoc_absolute_path}/index.html                              
      copying to ${public_javadoc_absolute_path}/index.html                                      
    </echo>                                                                                      
    <delete quiet="true">                                                                        
      <fileset dir="${public_javadoc_absolute_path}" />                                          
    </delete>                                                                                    
    <mkdir dir="${public_javadoc_absolute_path}" />                                              
    <copy todir="${public_javadoc_absolute_path}">                                               
      <fileset dir="javadoc" />                                                                  
    </copy>                                                                                      
    <echo>                                                                                       
      javadoc copied to ${public_javadoc_absolute_path}/index.html                               
      TO PUBLISH: cd into that repo, then git add javadoc;                                       
        git commit -m "update javadoc"; git push origin gh-pages                                
    </echo>                                                                                      
  </target>     

```

Now, when we run `ant javadoc`, we should see that the javadoc is copied to the sibling public repo.

In that repo, if we do our usual workflow, we should be able to publish these changes online:

``` 
  git status
  git add javadoc
  git status
  git commit -m "update javadoc"
  git push origin gh-pages
```

Once you've done this, visit this link (modifying as needed) to see the published javadoc:

`http://UCSB-CS56-M16.github.io/lab00_javadoc_jgaucho/javadoc/index.html`

If you have difficulties, ask your mentor/TA/instructor during lab, or post questions to Piazza.






