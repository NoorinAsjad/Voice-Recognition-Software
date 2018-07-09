load('Database.mat');
[nrows, ncols] = size(C);

if recording
    disp("Do you want to make new samples (0), or delete an existing one (1)?");
    userChoice = input('');
    
    if (userChoice ~= 0 && userChoice ~= 1)
        while (userChoice ~= 0 && userChoice ~= 1)
            userChoice = input('Please enter 0 or 1: ');
        end
    end
    
    if userChoice == 1
       disp("Would you like to view all the existing names in our Database?");
       choice = input('No (0) or yes (1)?');
       if (choice ~= 0 && choice ~= 1)
        while (choice ~= 0 && choice ~= 1)
            choice = input('Please enter No (0) or Yes (1): ');
        end
       end
       if choice == 1
           disp(" ");
           for i = 1:nrows
               disp(i + " " + C{i, 1});
           end
       end
       disp(" ");
       disp("Type in the EXACT name of the person whose records you want to delete");
       existingName = input('', 's');
       matched = false;
       
       for i = 1:nrows
               if ~matched
                   if(strcmp(existingName, C{i, 1}))
                        C(i,:) = [];
                        matched = true;
                        nrows = nrows - 1;
                        disp("Deleted records for: "+existingName);
                        
                   end
                   if ~matched && i == nrows
                       disp("Does not exist in our records.");
                   end
               end
               
       end 
       
       disp(" ");
       disp("Press 0 to create a new record, or any other number to exit");
       newChoice = input('');
       
       if newChoice == 0
           soundRecorder;
       end
       
    else
        soundRecorder;
    end
else
        soundRecorder
end
disp(" ");
disp("saving data and exiting");
save('Database', 'C', 'log');
