# spack-stack Tutorial

This tutorial provides an introduction to **spack** and **spack-stack**, covering:

- The general structure and functionality of **spack**.
- The advantages **spack** offers over alternatives like **conda** for building complex software stacks.
- How to use **spack-stack** to manage **JEDI** and **UFS**-based software stacks.

The tutorial walks through configuring **spack-stack** from scratch to build **mpas-jedi** on a Linux system.

## Viewing the Tutorial

The tutorial is presented using **reveal.js** and can be viewed in a browser. 

### Using Singularity

1. Clone the repository:
   ```bash
   git clone https://github.com/amstokely/spack-stack-tutorial.git
   ```

2. Navigate to the repository's root directory:
   ```bash
   cd spack-stack-tutorial
   ```

3. Run the following commands:
   ```bash
   bash singularity-compose.sh build
   bash singularity-compose.sh up 
   bash singularity-compose.sh run
   ```

This will build npm, install all required node modules, and open the presentation at `localhost:8000` in your default browser, all from within the Singularity container.

### Using npm

1. Clone the repository:
   ```bash
   git clone https://github.com/amstokely/spack-stack-tutorial.git
   ```

2. Navigate to the repository's root directory:
   ```bash
   cd spack-stack-tutorial
   ```

3. Create a symbolic link from the presentation directory to the reveal/presentation directory:
   ```bash
   ln -s presentation reveal/presentation
   ```

4. Navigate to the `reveal` directory:
   ```bash
   cd reveal
   ```

5. Run the following commands:
   ```bash
   npm install
   npm start
   ```

This will install all required node modules and open the presentation at `localhost:8000` in your default browser.

### Installing nvm (Node Version Manager)

If you don’t have **npm** installed, you can use **nvm** to easily install and manage Node.js versions. Follow these steps to install **nvm** and Node.js:

1. Install **nvm**:
   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
   ```

2. Restart your terminal or run the following command to load **nvm**:
   ```bash
   source ~/.bashrc
   ```

3. Install Node.js version 20:
   ```bash
   nvm install 20
   ```

4. Verify the correct Node.js version is installed:
   ```bash
   node -v
   # Should print: v20.17.0
   ```

5. Verify the correct npm version is installed:
   ```bash
   npm -v
   # Should print: 10.8.2
   ```

Now you have **npm** installed, you can run the tutorial as described in the "Using npm" section above.
