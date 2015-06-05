% SCRIPT TO CONVERT ALL DOUBLES FROM INPUT TO INTEGER SO THAT OTHER MATLAB
% SCRIPT CAN PICK IT UP
INPUT_FOLDER = 'raw_data';
OUTPUT_FOLDER = 'data_as_integer';
mkdir(OUTPUT_FOLDER);
convert = @(name_in, name_out) dlmwrite(name_out, ... 
                                int64(dlmread(name_in)), ...
                                'delimiter', ' ', ...
                                'precision', '%-7d');

s = dir(fullfile(INPUT_FOLDER, '*.txt'));
if size(s) == [0 1]
     sprintf('Please move all raw data files (as .txt) in folder %s', INPUT_FOLDER)
else
    for name_in = {s.name}'
        convert(fullfile(INPUT_FOLDER, name_in{1}), fullfile(OUTPUT_FOLDER, name_in{1}));
    end    
end
