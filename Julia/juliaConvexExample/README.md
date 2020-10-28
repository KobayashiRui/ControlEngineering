# Convex.jl example notebooks

Start Julia in this directory and set the project flag to point to this directory. E.g. run the command

```julia
julia --project=.
```

in this directory.

Then add `IJulia` if it's not installed already in your global environment by

```julia
pkg> add IJulia
```

Also call `instantiate` to download the required packages:

```julia
pkg> instantiate
```

Then launch Jupyter:

```julia
julia> using IJulia

julia> notebook(dir=pwd(); detached=true)
```

This should allow you to try any of the notebooks.
