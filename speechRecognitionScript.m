[nrows, ncols] = size(C);
threshold = 68;
name = 'Does not exist in our database.';
for i = 1:nrows
    temp = C{i,2};
    score = myscorefunction(temp, unknown);
    if score<threshold
       threshold = score; 
       name = C{i};
    end
end