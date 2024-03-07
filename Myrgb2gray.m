function [bestImage,bestWeights,maxContrast]=Myrgb2gray(ImagePath)
    I = ImagePath;
    count = 0;
    maxContrast=0;

    % Separate RGB channels
    R = uint8(I(:, :, 1));% make the values and 8unsigned bit integer 
    G = uint8(I(:, :, 2));
    B = uint8(I(:, :, 3));

   

    for i = 0:0.1:1
        for j = 0:0.1:(1 - i)
            k = 1 - i - j;

            % Calculate grayscale value using weighted sum
            grayconver = i * R + j * G + k * B;
            

            if isequal(round(i + j + k, 10), 1)  % Using round to handle floating-point precision issues
                count = count + 1;
                fprintf('Red: %.2f, Green: %.2f, Blue: %.2f\n', i, j, k);

              
               

                % Calculate the rms contrast
                rmsContrast = calculateRMSContrast(grayconver);
                fprintf('RMS contrast: %.2f\n', rmsContrast);
                 if rmsContrast > maxContrast
                    maxContrast = rmsContrast;
                    
                    bestWeights = [i, j, k];
                 end
            end
         end
   
    end
    %best Image
    bestImage=bestWeights(1)* R + bestWeights(2) * G + bestWeights(3) * B;

    %Display it Contrast
    disp("maxContrast=")
    disp(maxContrast)

     % Display the best weights
    disp(['Best weights for RGB channels: [Red: ', num2str(bestWeights(1)), ...
          ', Green: ', num2str(bestWeights(2)), ', Blue: ', num2str(bestWeights(3)), ']']);

    %display image with Maximum Contrast
    %figure(68),imshow(uint8(bestImage)),title("Maximum Contrast"),
    %title(['R: ', num2str(bestWeights(1)), ' G: ', num2str(bestWeights(2)), ' B: ', num2str(bestWeights(3))]);

end