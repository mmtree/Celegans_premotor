###########################
###### ODE function #######
###########################
function lorenz!(du,u,p,t)
    γ, β = p
    #### get the current signal ####
    usig_tmp = []
    for j in collect(1:Nsignals)
        append!(usig_tmp,Dsigs_interp[j](t))
    end
    
    #### put both the intrinsic and signal into single vector ####
    utmp = zeros(Ncore)
    utmp[ids_intrinsic] = u  #put in current intrinsic timepoints
    utmp[ids_signal] = usig_tmp
    du_tmp = zeros(Ncore)
    ublockT = transpose(repeat(utmp, 1, Ncore))
    ublock = repeat(utmp, 1, Ncore)
    #A_u = A*u
    A_RELUu = A*Relu.(utmp) # use instead of A_u
    W_u = diag(W*(ublock - ublockT))
    for j in collect(1:Ncore)
        ########### SCALE UP INTRINSIC DYNAMICS! ############
        du_tmp[j] = scale_factor*a*(utmp[j].-fp1).*(utmp[j].-fp2).*(utmp[j].-fp3) + d[j] + γ*A_RELUu[j] + β*W_u[j] # fps version
    end
    
    du_tmp = du_tmp[ids_intrinsic]  # JUST output the derivative for the intrinsic neurons!
    for j in collect(1:Nintrinsic)
        #du[j] = -1*u[j] + Dsigs_interp[j](t)
        du[j] = du_tmp[j]
    end
end



#################################
#### moving average function ####
#################################
function moving_average(data::AbstractVector{T}, window_size::Int) where {T<:Real}
    n = length(data)
    ma = similar(data, T, n)
    
    for i = 1:n
        start_idx = max(1, i - window_size + 1)
        end_idx = min(n, i)
        window = data[start_idx:end_idx]
        ma[i] = sum(window) / length(window)
    end
    
    return ma
end



#################################
#### heaviside pulse function ###
#################################
function heaviside_pulse(t::Real, t0::Real, A::Real)
    if t < t0
        return 0
    elseif t == t0
        return 0.5 * A
    else
        return A
    end
end
