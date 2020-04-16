% function valuta_trained_NN(model)

n_inputs=model.Layers(1).InputSize;
fprintf('NN _inputs: %6.0f %6.0f\n',n_inputs(1:2));
ECG_mean=[ I_mean II_mean III_mean V1_mean V2_mean V3_mean V4_mean V5_mean V6_mean ];
ECG_TMP=[ I;II;III; V1; V2; V3; V4; V5; V6];
if(size(ECG_TMP,2)<5000), ECG_TMP(1,5000)=0;end
ECG_PRO=ECG_TMP(1:9,1:5000)';
%ECG_CINC.dati=ECG_PRO(:);

ECG_CINC.dati=[ECG_PRO(:)' ECG_mean];

    Fs=500;
    data=ECG_CINC.dati(:);
%     fprintf('ECG: size:%7.0f   sum:%10.0f   abs:%12.0f\n',numel(data),sum(data),sum(abs(data)));
    
    [~,signalLength] = size(data);
    signalLength = numel(data);
%     fprintf('size data:%6.0f%6.0f,  signal length ->  %6.0f \n',size(data),signalLength);
    fb = cwtfilterbank('SignalLength',signalLength, 'SamplingFrequency',Fs,'VoicesPerOctave',12);

    cfs = abs(fb.wt(data));
    im = ind2rgb(im2uint8(rescale(cfs)),jet(128));
    imwrite(imresize(im,[224 224]),'NEW_IMAGE.jpg');
    ECG_image=imread('NEW_IMAGE.jpg');
    
 %   ECG_image=im2uint8(imresize(im,[224 224]));
    
    fprintf('Image- size:');fprintf('%6.0f',size(ECG_image));
    fprintf(' sum:%10.0f%10.0f%10.0f \n',sum(sum(ECG_image)));
    
    [YPred,probs] = classify(model,ECG_image);
    
    out_labels=[];
    out_labels(1:9)=0;
    iii=find(probs>0.3);
    out_labels(iii)=1;
    scores=probs;
    
    