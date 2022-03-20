module Gridman

struct Gauge
  x::Array{Matrix{ComplexF64}}
  y::Array{Matrix{ComplexF64}}
  z::Array{Matrix{ComplexF64}}
  t::Array{Matrix{ComplexF64}}
  xdim::Int64
  ydim::Int64
  zdim::Int64
  tdim::Int64
  v::Int64

  function Gauge(xdim, ydim, zdim, tdim)
    v = xdim * ydim * zdim * tdim;
    diag = [1 0 0; 0 1 0; 0 0 1];
    diags = fill(diag, v);
    return new(diags, diags, diags, diags, xdim, ydim, zdim, tdim, v);
  end
end

struct Fermion
  value::Array{Vector{ComplexF64}}
  xdim::Int64
  ydim::Int64
  zdim::Int64
  tdim::Int64
  v::Int64

  function Fermion(xdim, ydim, zdim, tdim)
    v = xdim * ydim * zdim * tdim;
    value = [rand(ComplexF64, 12) for v in 1:v];
    return new(value, xdim, ydim, zdim, tdim, v);
  end
end

greet() = print("Hello World!")

end # module
