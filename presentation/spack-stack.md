## spack-stack

- Spack configurations can be complex, with multiple configuration scopes:
  - `defaults`
  - `system`
  - `site`
  - `user`
  - `custom`
  - `environment`


## spack-stack

- spack-stack manages Spack configurations across various HPC systems for:
  - UFS
  - JEDI
- System specific configurations are stored in ```configs/site```
- Environment specific configurations are stored in ```configs/templates```


## spack-stack sites
* Contains site-specific spack yaml configuration files
  * ```compilers.yaml```
  * ```packages.yaml```
  * ```modules.yaml```
  * ```mirrors.yaml```
  * ```config.yaml```
* Easy to define new sites.


## spack-stack templates
* Contains environment-specific ```spack yaml```
  * Templates for building UFS and JEDI are included
  * Easy to define new templates


## Building a mpas-bundle spack-stack environment for linux

1. Download spack-stack version 1.7.0
2. Create a spack-stack site
3. Create a spack-stack mpas-bundle template
4. Create a mpas-bundle spack-stack environment
5. Concretize the environment
6. Install environment packages


## Download spack-stack

* Clone the spack-stack repository
```bash
git clone https://github.com/JCSDA/spack-stack -b release/1.7.0 --recurse-submodules spack-stack_1.7.0
```
* Enter the spack-stack directory and source `setup.sh`
```bash
cd spack-stack_1.7.0
source setup.sh
 ```


## Create a spack-stack site 

* Create a directory in `configs/site` with the name of your computer and enter it.
```bash
mkdir configs/sites/alta
cd configs/sites/alta
```
* Create the following yaml files:
  * `compilers.yaml`
  * `config.yaml`
  * `modules.yaml`
  * `packages.yaml`


**packages.yaml**

___
```yaml
packages:
  all:
    compiler:: [gcc@12.2.0]
    providers:
      mpi:: [openmpi/5.0.3]

### MPI, Python, MKL
  mpi:
    buildable: False
  openmpi:
    externals:
    - spec: openmpi@5.0.3%gcc@12.2.0
      prefix: /home/astokely/projects/spack-stack/spack/opt/spack/linux-almalinux9-skylake/gcc-12.2.0/openmpi-5.0.3-iagvpdcvp4m3e7fosghblekm666baidx
      modules:
      - gcc/12.2.0
      - openmpi/5.0.3
```


**config.yaml**
___

```yaml
config:
  build_jobs: 4
```


**modules.yaml**
___

```yaml
modules:
  # These are configurations for the module set named "default"
  default:
    enable::
    - lmod
    lmod:
      hash_length: 0
      hide_implicits: true
      all:
        autoload: run
```


**compilers.yaml**
___

```bash
compilers::
  - compiler:
      spec: gcc@=12.2.0
      paths:
        cc: /home/astokely/projects/spack-stack/spack/var/spack/environments/base/.spack-env/view/bin/gcc
        cxx: /home/astokely/projects/spack-stack/spack/var/spack/environments/base/.spack-env/view/bin/g++
        f77: /home/astokely/projects/spack-stack/spack/var/spack/environments/base/.spack-env/view/bin/gfortran
        fc: /home/astokely/projects/spack-stack/spack/var/spack/environments/base/.spack-env/view/bin/gfortran
      flags: {}
      operating_system: almalinux9
      target: x86_64
      modules:
      - gcc/12.2.0
      environment: {}
      extra_rpaths: []
```


## Create a spack-stack mpas-bundle template

* Create a directory named mpas-bundle in ```configs/templates```
```bash
mkdir configs/templates/mpas-bundle 
cd mpas-bundle
```



**Create a spack.yaml file and copy the below yaml into it**
___

```yaml
spack:
  concretizer:
    unify: when_possible
  view: false
  include:
  - site
  - common
  definitions:
  - compilers: ['%gcc@12.2.0']
  - packages:
    - ecmwf-atlas@0.35.0
    - ecbuild
    - eckit
    - fckit
    - parallelio
    - netcdf-c
    - netcdf-fortran
    - netcdf-cxx4
    - parallel-netcdf
    - gptl
    - jedi-cmake
    - gsl-lite
    - udunits
    - nccmp
    - py-pycodestyle
    - py-yq

  specs:
  - matrix:
    - [$packages]
    - [$compilers]
```





