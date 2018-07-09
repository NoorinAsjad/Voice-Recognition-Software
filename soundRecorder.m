userText = input("Do you want to record voice sample (0) or supply a stored voice sample from your pc? (1)");
if (userText ~= 0 || userText ~= 1)
    while (userText ~= 0 || userText ~= 1)
        userText = input("Please enter 0 or 1");
    end
end
load('Database.mat');
[nrows, ncols] = size(C);
processedSpeech = [];

if (userText == 0)
   disp("Starting voice recorder");
   
   disp("You will need to record the following 3 times in clear voice");
   disp();
   disp("A QUICK BROWN FOX JUMPED OVER THE LAZY DOG");
   counter = 3;
   while(counter>0)
       disp("Sample "+(4-counter));
       z = audiorecorder(44100, 16, 1);
       disp("Start speaking");
       recordblocking(z, 5);
       disp("Sample number "+(4-counter)+" completed");
       sound(z);
       disp("Are you satisfied, or do you want to retake that?")
       user = input("Press 0 if you want to redo the sample, or any other number to proceed");
       if user ~= 0
           counter = counter - 1;
           x = getaudiodata(z);
           speech = speechProcessing(x);
           processedSpeech = [processedSpeech speech];
       end
   end
else
    disp("You chose to supply your own voice sample. You will need sound files of 44.1 kHz sampling frequency")
    disp("You will need to supply 3 voice samples saying the following once, each time in clear voice");
    disp();
    disp("A QUICK BROWN FOX JUMPED OVER THE LAZY DOG");
    disp();
    counter = 3;
    while (counter > 0)
        disp("File number: "+(4-counter));
        userFile = input("Type in the name of the file (with extension)", 's');
        Fs = 44100;
        [x, Fs] = audioread(userFile);
        disp("Are you satisfied, or do you want to type another name for that file?")
        user = input("Press 0 if you want to redo the sample, or any other number to proceed");
        if user ~= 0
           counter = counter - 1;
           speech = speechProcessing(x);
           processedSpeech = [processedSpeech speech];
        end
        
    end
end

userName = input("Please type your name",'s');
C{nrows+1, 1} = userName;
C{nrows+1, 2} = processedSpeech;
save('Database');

       
        

    
