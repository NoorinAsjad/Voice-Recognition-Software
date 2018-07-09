%[x, Fs] = audioread('Fred1.wav');
function processedSpeech = speechProcessing (x)
    x = x(:,1);
    NFFT = 1000; Fs = 44100;
    S = spectrogram(x, hamming(1000), 0, NFFT, Fs);
    %k = 0: (NFFT-1);
    Fmax = 4000;
    S = abs(S);
    kmax = round(Fmax/Fs * NFFT);
    krange = 1:kmax;
    S = S(krange, :);
    [nrows, ncols] = size(S);
    x2 = [];
    for i = 1:ncols
        tmp = S(:,i);
        if norm(tmp)>0
            tmp = tmp/norm(tmp);
            x2 = [x2 tmp];
        end
    end
    processedSpeech = x2;
end