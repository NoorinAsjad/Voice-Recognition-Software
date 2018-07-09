userText = input("Do you want to record voice samples (0) or supply a stored voice sample file from your pc? (1)");
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
   counter = 1;
   if(recording)
       disp("You will need to record the following 3 times in clear voice");
       counter = 3;
   else
       disp("You will need to record the following in clear voice");
   end
   disp();
   disp("A QUICK BROWN FOX JUMPED OVER THE LAZY DOG");
   
   while(counter>0)
       number = 1;
       if(recording)
           number = 4-counter;
       end
       disp("Sample "+number);
       z = audiorecorder(44100, 16, 1);
       disp("Start speaking");
       recordblocking(z, 5);
       disp("Sample number "+number+" completed");
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
    counter = 1;
    if recording
        disp("You will need to supply 3 voice sample files saying the following once, each time in clear voice");
        counter = 3;
    else
        disp("You will need to supply a voice sample file saying the following once, in clear voice");
    end
    disp();
    disp("A QUICK BROWN FOX JUMPED OVER THE LAZY DOG");
    disp();
    
    while (counter > 0)
        number = 1;
       if(recording)
           number = 4-counter;
       end
        disp("File number: "+number);
        userFile = input("Type in the name of the audio file (with extension)", 's');
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

if recording
    userName = input("Please type your name",'s');
    C{nrows+1, 1} = userName;
    C{nrows+1, 2} = processedSpeech;
    save('Database', C);
else
    unknown = processedSpeech;
    speechRecognitionScript;
    disp("The given sample most closely resembles the following person in our database:");
    disp(name);
end

       
        

    
