######################
## RELU function #####
######################
function Relu(x)
    if x>=0
        x
    else
        0
    end
end

##################################
## data replacement function #####
##################################
function Data_Replacement(i, nm, names_have, switchout_list, Dict_nms, ts_myneuros, dtsdt_myneuros, Fts1, dFts1dt)
    if (length(nm) == 4) & (nm in (switchout_list))
        ############
        ### print ###
        println("switchout ", nm)
            nm_new = [] # put new name in
            if string(nm[4]) == "L"
                nm_new = string(nm[1:3])*string("R")
            elseif string(nm[4]) == "R"
                nm_new = string(nm[1:3])*string("L")
            end
            if nm_new in(names_have) # the missing neuron has a twin in the dataset! sub in this!
                println(nm_new)
                ts_myneuros[i,:] = Fts1[Dict_nms[nm_new]]  
                dtsdt_myneuros[i,:] = dFts1dt[Dict_nms[nm_new]]
            
            elseif nm == "AVBL"  ## if AVBL isn't here and doesn't have twin then sub in RIB
                println("AVBL isn't here and doesn't have twin")
                if "RIBL" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIBL"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIBL"]]
                elseif "RIBR" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIBR"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIBR"]]
                end
                    
            elseif nm == "AVBR"
                println("AVBR isn't here and doesn't have twin")
                if "RIBR" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIBR"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIBR"]]
                elseif "RIBL" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIBL"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIBL"]]
                end 
                    
            elseif nm == "RIBL"  ## if RIBL isn't here and doesn't have twin then sub in AVB
                println("RIBL isn't here and doesn't have twin")
                if "AVBL" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["AVBL"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["AVBL"]]
                elseif "AVBR" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["AVBR"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["AVBR"]]
                end
                    
            elseif nm == "RIBR"  ## if RIBR isn't here and doesn't have twin then sub in AVB
                println("RIBR isn't here and doesn't have twin")
                if "AVBR" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["AVBR"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["AVBR"]]
                elseif "AVBL" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["AVBL"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["AVBL"]]
                end
            elseif nm == "AIBL"  ## if AIBL isn't here then sub in RIM
                println("AIBL isn't here and doesn't have twin")
                if "RIML" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIML"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIML"]]
                elseif "RIMR" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIMR"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIMR"]]
                end
            elseif nm == "AIBR"  ## if AIBR isn't here then sub in RIM
                println("AIBR isn't here and doesn't have twin")
                if "RIMR" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIMR"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIMR"]]
                elseif "RIML" in(names_have)
                    ts_myneuros[i,:] = Fts1[Dict_nms["RIML"]]  
                    dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["RIML"]]
                end     
            end
    ###### length == 5 #########
    elseif (length(nm) == 5) & (nm in (switchout_list))
        ############
        ### print ###
        println("switchout ", nm)
            nm_new = [] # put new name in
            if string(nm[5]) == "L"
                nm_new = string(nm[1:4])*string("R")
            elseif string(nm[5]) == "R"
                nm_new = string(nm[1:4])*string("L")
            end
            if nm_new in(names_have) # the missing neuron has a twin in the dataset! sub in this!
                println(nm_new)
                ts_myneuros[i,:] = Fts1[Dict_nms[nm_new]]  
                dtsdt_myneuros[i,:] = dFts1dt[Dict_nms[nm_new]]
            end
    ###### nm == RID #########
    elseif nm == "RID"
            if "AVBR" in(names_have)
                ts_myneuros[i,:] = Fts1[Dict_nms["AVBR"]]  
                dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["AVBR"]]
            elseif "AVBL" in(names_have)
                ts_myneuros[i,:] = Fts1[Dict_nms["AVBL"]]  
                dtsdt_myneuros[i,:] = dFts1dt[Dict_nms["AVBL"]]
            end   
    end
    
end

