prompt = ('Please enter the file name: ');
    fileName = input(prompt, 's');
      while isempty(fileName)
          fprintf('No file name entered.\n');
          pause;
          prompt = ('Please enter the file name: \n');
          fileName = input(prompt,'s');
      end