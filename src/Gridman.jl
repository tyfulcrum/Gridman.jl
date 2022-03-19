module Gridman

struct Gauge
  x::Array{ComplexF64}
  y::Array{ComplexF64}
  z::Array{ComplexF64}
  t::Array{ComplexF64}
  xdim::Int64
  ydim::Int64
  zdim::Int64
  tdim::Int64
  v::Int64

  function Gauge(xdim, ydim, zdim, tdim)
    v = xdim * ydim * zdim * tdim;
    diag = [1 0 0; 0 1 0; 0 0 1];
    return new(diag, diag, diag, diag, xdim, ydim, zdim, tdim, v);
  end
end

greet() = print("Hello World!")

end # module
