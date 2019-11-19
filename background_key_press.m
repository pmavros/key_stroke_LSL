% detect background key press;
% then send to LSL;

% if it gets stuck, use ctrl+c to interrupt matlab

function background_key_press ()

    F4key = KbName('F4');
    % load lab streaming layer
    disp('Loading LSL library...');
    lib = lsl_loadlib();
    
    % make a new stream outlet
    disp('Creating a new streaminfo...');
    info = lsl_streaminfo(lib,'Keyboard_Press','Markers',1,0,'cf_string','Biopac_laptop');

    disp('Opening an outlet...');
    outlet = lsl_outlet(info);
   


    % Switch KbName into unified mode: It will use the names of the OS-X
    % platform on all platforms in order to make this script portable:
    KbName('UnifyKeyNames');
    esc=KbName('ESCAPE');
    abortit = 0;
    % Endless loop, runs until ESC key pressed:
    while abortit < 2

        % Check for abortion by user:
        abortit = 0;
        
            
            [keyIsDown,~,keyCode] = KbCheck;
            
        if (keyIsDown)
            % send data into the outlet
            keypressed = KbName(keyCode);
            disp(keypressed);
            pause(0.1);
            
            % TODO create a custom short cut to enter marker in Biopac and
            % LSL e.g. F4?
            
          if keyCode (F4key) 
              outlet.push_sample({'biopac keypress'});
              fprintf('Now transmitting marker to LSL...\n');
              % pause(0.1);
           end
          
            % fprintf('The key pressed was %s \n', KbName(keyCode))
            % disp(KbName(keyCode) +" " + keyCode + " " + secs);
            
        end
            
%         [keyIsDown,secs,keyCode]=KbCheck; % #ok<ASGLU>
        if (keyIsDown && keyCode(esc))
            % Set the abort-demo flag.
            abortit = 2;
            break;
        end

    end

end


