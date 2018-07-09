[nrows, ncols] = size(C);
minscore = 200;
name = 'Does not exist in our database.';
for i = 1:nrows
    temp = C{i,2};
    score = myscorefunction(temp, unknown);
    if score<minscore
       minscore = score; 
       name = C{i};
    end
end