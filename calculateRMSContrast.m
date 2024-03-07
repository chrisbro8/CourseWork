function contrast = calculateRMSContrast(grayscaleImage)
    % Step 1: Calculate the average of the grayscale image
    Iavg = mean(mean(grayscaleImage));

    % Step 2: Subtract the average value and square the difference
    sqr = (grayscaleImage - Iavg).^2;

    % Step 3: Add all the square differences
    Summation = sum(sqr(:));

    % Step 4: Calculate the square root of the result
    [rows, columns] = size(grayscaleImage);
    contrast = sqrt(Summation / (rows * columns));
end
