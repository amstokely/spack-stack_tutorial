## Spack installation examples

* Install netcdf-c:
  ```bash
  spack install netcdf-c
  ```
* Install netcdf-c version 4.9.2 with GCC 12.2.0:
    ```bash
    spack install netcdf-c@4.9.2 %gcc@12.2.0
    ```
* Install netcdf-c version 4.9.2 with the Intel compiler on a system with AMD CPUs, enabling parallel-NetCDF support and linking against static HDF5:

```bash
spack install netcdf-c +mpi +pnetcdf ^hdf5+mpi+static %intel fcflags="-O2 -march=core-avx2" cflags="-O2 -march=core-avx2" cxxflags="-O2 -march=core-avx2"
``split_list = re.split('(_\d)', s, maxsplit=1)

# Remove the delimiter from the list
split_list = [split_list[0], ''.join(split_list[1:])]
`