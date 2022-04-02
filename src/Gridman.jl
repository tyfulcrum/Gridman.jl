module Gridman

using LinearAlgebra;
struct Gauge
  x::Vector{Matrix{ComplexF64}}
  y::Vector{Matrix{ComplexF64}}
  z::Vector{Matrix{ComplexF64}}
  t::Vector{Matrix{ComplexF64}}
  xdim::Int64
  ydim::Int64
  zdim::Int64
  tdim::Int64
  volume::Int64

  # Generate gauge field for test
  function Gauge(xdim, ydim, zdim, tdim)
    volume = xdim * ydim * zdim * tdim;
    diag = [1 0 0; 0 1 0; 0 0 1];
    diags = fill(diag, volume);
    return new(diags, diags, diags, diags, xdim, ydim, zdim, tdim, volume);
  end
end

struct Fermion
  value::Vector{Vector{ComplexF64}}
  xdim::Int64
  ydim::Int64
  zdim::Int64
  tdim::Int64
  volume::Int64

  # Generate fermion field for test
  function Fermion(xdim, ydim, zdim, tdim)
    volume = xdim * ydim * zdim * tdim;
    value = [rand(ComplexF64, 12) for volume in 1:volume];
    return new(value, xdim, ydim, zdim, tdim, volume);
  end
end

function auto_tensor_mul(U::Matrix{ComplexF64}, χ::Vector{ComplexF64})
  γ = [0 0 0 im; 0 0 im 0; 0 -im 0 0; -im 0 0 0];
  ϵ = map(x -> x * U, (I - γ));
  ϕ = ϵ * reshape(χ, (4, 3));
  return ϕ;
end

function hc_tensor_mul(U::Matrix{ComplexF64}, χ::Vector{ComplexF64})
  ϕ_dirac_1 = U * χ[1:3] + (-im) * U * χ[10:12];
  ϕ_dirac_4 = im * U * χ[1:3] + U * χ[10:12];
  ϕ_dirac_2 = U * χ[4:6] + (-im) * U * χ[7:9];
  ϕ_dirac_3 = im * U * χ[4:6] + U * χ[7:9];
  ϕ = vcat(ϕ_dirac_1, ϕ_dirac_2, ϕ_dirac_3, ϕ_dirac_4);
  return ϕ;
end

greet() = print("Hello World!")

end # module
