function Ihist = Myhist(ImagePath)
    % Read the image
    I = ImagePath;
    [M, N] = size(I);

    % Initialize intensity and count arrays
    Intensity = 0:255;
    count = zeros(1, 256); %set all values to 0

    % Calculate the histogram
    for i = 1:256
        for m = 1:M
            for n = 1:N
                if I(m, n) == i - 1
                    count(i) = count(i) + 1;
                end
            end
        end
    end


    Ihist = count;
end
