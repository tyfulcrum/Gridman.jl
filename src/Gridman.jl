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
  volume::Int64

  function Gauge(xdim, ydim, zdim, tdim)
    volume = xdim * ydim * zdim * tdim;
    diag = [1 0 0; 0 1 0; 0 0 1];
    diags = fill(diag, volume);
    return new(diags, diags, diags, diags, xdim, ydim, zdim, tdim, volume);
  end
end

struct Fermion
  value::Array{Vector{ComplexF64}}
  xdim::Int64
  ydim::Int64
  zdim::Int64
  tdim::Int64
  volume::Int64

  function Fermion(xdim, ydim, zdim, tdim)
    volume = xdim * ydim * zdim * tdim;
    value = [rand(ComplexF64, 12) for volume in 1:volume];
    return new(value, xdim, ydim, zdim, tdim, volume);
  end
end

greet() = print("Hello World!")

end # module
