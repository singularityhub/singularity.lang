# Singularity.lang

Welcome to the Singularity.lang repo! Here we will provide several syntax
highlighters for some of your favorite languages. 

 - [gedit](gedit)
 - [vim](vim)
 - [nano](nano)


Each language has its own set of README instructions with corresponding 
files in the subfolders linked above, and you can follow the instructions
to have the editor render your Singularity recipe files. For example,
here is the before and after shot for gedit.

**Before Install**

![gedit/img/before-install.png](gedit/img/before-install.png)

**After Install**

![gedit/img/after-install.png](gedit/img/after-install.png)

So beautiful!

## Install
Installation means simply copying the file into the language-specs folder
that your gedit installation uses. For example:

**1. Clone the Repository**

```bash
git clone https://www.github.com/singularityware/singularity.lang
cd singularity.lang
```

**2. Move the syntax file**

See the README in each subfolder for specific instructions! Generally the last
step of install is to move the file to some language spec folder of the software,
and then to restart the editor(s).

## Contributing

If you are looking for the Atom syntax highlighter, see
 [language-singularity](https://www.github.com/singularityware/language-singularity.git). 
If you would like to add an editor, please open an issue or Pull Request if you
have an editor to contribute.
