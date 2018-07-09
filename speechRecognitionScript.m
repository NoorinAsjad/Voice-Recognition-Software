[nrows, ncols] = size(C);
threshold = 70;
name = 'Does not exist in our database.';
score = 0;
minscore = 200;
matcha = false;
for i = 1:nrows
    temp = C{i,2};
    score = myscorefunction(temp, unknown);
    if(score<minscore)
        minscore = score;
    end
    if score<threshold
       threshold = score; 
       name = C{i};
       matcha = true;
    end
end
if matcha
    scoreArray = [scoreArray threshold];
else
    scoreArray = [scoreArray minscore];
end