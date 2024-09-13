# spack-stack Tutorial

This tutorial provides an introduction to **spack** and **spack-stack**, covering:

- The general structure and functionality of **spack**.
- The advantages **spack** offers over alternatives like **conda** for building complex software stacks.
- How to use **spack-stack** to manage **JEDI** and **UFS**-based software stacks.

The tutorial illustrates the process by configuring **spack-stack** from scratch to build **mpas-jedi** on NCAR’s supercomputer, **Derecho**.

## Viewing the Tutorial
In order to view the tutorial, you will either need to have 
singularity or npm installed on your system as the presentation is built using
**reveal.js** and is viewed in a browser. While this complicates the process of 
viewing the tutorial, reveal.js supports using Markdown to create slides, which
in turn allows the presentation to contain copy and pasteable code snippets.
### Singularity
First clone the repository:
```bash
git clone https://github.com/amstokely/spack-stack-tutorial.git
```
then enter the repository root directory 
```bash
cd spack-stack_tutorial
```
and run the following command:
```bash
bash singularity-compose.sh build
bash singularity-compose.sh up 
bash singularity-compose.sh run 
```
This will build npm, install all required node modules, and open the presentation on
localhost:8000 in your default browser, all from within the singularity container.

### npm
First clone the repository:
```bash
git clone https://github.com/amstokely/spack-stack-tutorial.git
```
then enter the repository root directory
```bash
cd spack-stack_tutorial
```
and create a symbolic link from the presentation directory to 
the reveal/presentation directory:
```bash
ln -s presentation reveal/presenation
```
Now enter the reveal directory:
```bash
cd reveal
```
and run the following commands:
```bash
npm install
npm start
```
This will install all required node modules and open the presentation on
localhost:8000 in your default browser.