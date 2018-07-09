[nrows, ncols] = size(C);
minscore = 1000;
name = 'random';
for i = 1:nrows
    temp = C{i,2};
    score = myscorefunction(temp, unknown);
    if score<minscore
       minscore = score; 
       name = C{i};
    end
end