
    
disp("Do you want to record voice samples (0) or supply a stored voice sample file from your pc? (1):");
userText = input('');
if (userText ~= 0 && userText ~= 1)
    while (userText ~= 0 && userText ~= 1)
        userText = input('Please enter 0 or 1: ');
    end
end

processedSpeech = [];

if (userText == 0)
   disp("Starting voice recorder");
   counter = 1;
   if(recording)
       disp("You will need to record the following 3 times in clear voice");
       counter = 3;
       disp(" ");
       disp("A QUICK BROWN FOX JUMPED OVER THE LAZY DOG");
   else
       disp("You will need to record a 5 second audio clip in clear voice");
   end
   disp(" ");
   pause(2.0);
   
   while(counter>0)
       number = 1;
       if(recording)
           number = 4-counter;
       end
       disp("Sample "+number);
       z = audiorecorder(44100, 16, 1);
       disp("Start speaking: ");
       if recording
           disp("A QUICK BROWN FOX JUMPED OVER THE LAZY DOG");
       else
           disp("Speak anything in clear voice");
       end
       recordblocking(z, 5);
       disp("Sample number "+number+" completed");
       play(z);
       disp("Are you satisfied, or do you want to retake that?")
       user = input('Press 0 if you want to redo the sample, or any other number to proceed: ');
       disp(" ");
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
        disp("You will need to supply 3 voice sample files saying the following ONCE, each time in clear voice");
        counter = 3;
        disp(" ");
        disp("A QUICK BROWN FOX JUMPED OVER THE LAZY DOG");
        disp(" ");
    else
        disp("You will need to supply around a 5 second voice sample file, in clear voice");
    end
    disp(" ");
    
    while (counter > 0)
        number = 1;
       if(recording)
           number = 4-counter;
       end
        disp("File number: "+number);
        userFile = input('Type in the name of the audio file (with extension): ', 's');
        Fs = 44100;
        [x, Fs] = audioread(userFile);
        disp("Are you satisfied, or do you want to type another name for that file?")
        disp(" ");
        user = input('Press 0 if you want to redo the sample, or any other number to proceed: ');
        if user ~= 0
           counter = counter - 1;
           speech = speechProcessing(x);
           processedSpeech = [processedSpeech speech];
        end
        
    end
end

if recording
    userName = input('Please type your name: ','s');
    C{nrows+1, 1} = userName;
    C{nrows+1, 2} = processedSpeech;
else
    unknown = processedSpeech;
    speechRecognitionScript;
    disp("The given sample most closely resembles the following person in our database:");
    disp(name);
    disp("For debugging purposes: Was that done correctly?");
    [rows, cols] = size(log);
    log{2,cols} = input('Type yes or no: ', 's');
end

       
        

    
