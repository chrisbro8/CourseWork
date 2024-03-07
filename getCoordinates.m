function [x, y] = getCoordinates(OriginalImage)
    [x,y] = find(OriginalImage);% x is row and Y is column
    %it find element of non-zero element
    %so where the image has 1

    % Display the coordinates if there are non-zero elements
    if ~isempty(x) %checking if its empty
        disp('Object coordinates:');

        for i = 1:length(y)
            %convert to String to concatenate the values
            disp(['Coordinate: (' num2str(x(i)) ', ' num2str(y(i)) ')']);
        end
    else
        disp('No object coordinates found.');
    end
end