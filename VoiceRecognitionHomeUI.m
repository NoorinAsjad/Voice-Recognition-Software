clear
disp("VOICE RECOGNITION SOFTWARE");
disp("By Noorin Asjad");
disp(" ");
disp("What would you like to do today?");
disp(" ");
disp("1. Save new voice samples into the database/Delete or replace an existing record")
disp("2. Match a new voice sample against the existing data in our database");
disp(" ");
menuSelect = input('Type 1 or 2: ');
if (menuSelect ~= 1 && menuSelect ~= 2)
    while (menuSelect ~= 1 && menuSelect ~= 2)
        menuSelect = input('Please enter 1 or 2: ');
    end
end
recording = false;
if (menuSelect == 1)
    disp("You selected:");
    disp("1. Save new voice samples into the database/Delete or replace an existing record");
    recording = true;
else
    disp("You selected:")
    disp("2. Match a new voice sample against the existing data in our database");
end
disp(" ");
deleteRecord;
