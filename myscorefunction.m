function score = myscorefunction(data, unknown)
    score = sum(min(sqrt(2-2*data'*unknown)));
end