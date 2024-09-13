## Installing NumPy with Spack vs. Conda 


**Install NumPy**

---
### Conda
```bash
conda install numpy
```
* Precompiled binary built with gcc and O2 optimization.


**Install NumPy**

---
### Spack
```bash
spack install py-numpy
```
  * Builds with default compiler from source with sensible optimization flags.


**Install NumPy with Intel Classic 2023.2.1 compiler**

---
### Conda
  ```bash
  conda install numpy 
  ```
  * Precompiled binary built with gcc and O2 optimization.
  * No control over the compiler. 


**Install NumPy with Intel Classic 2023.2.1 compiler**

---
### Spack
```bash
spack install py-numpy %intel@2023.2.1 # Builds with Intel Classic 2023.2.1 from source
```
  * Builds with Intel Classic 2023.2.1 from source with sensible optimization flags.
  * Full control over the compiler.


**Install NumPy with Intel Classic 2023.2.1 compiler and optimization flags**

---
### Conda
```bash
  conda install numpy 
  ```
  * Precompiled binary built with gcc and O2 optimization.
  * No control over the compiler or optimization flags.


**Install NumPy with Intel Classic 2023.2.1 compiler and optimization flags**

---
### Spack
  ```bash
  spack add py-numpy %intel@2023.2.1 ^openblas threads=openmp cflags="-O3 -march=native -mtune=native -funroll-loops -ffast-math -flto -fopenmp" cxxflags="-O3 -march=native -mtune=native -funroll-loops -ffast-math -flto -fopenmp"
  ```
  * Builds with Intel Classic 2023.2.1 from source with all provided optimization flags.
  * Full control over the compiler and optimization flags.
