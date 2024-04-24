function varargout = SCARA1(varargin)
% SCARA1 MATLAB code for SCARA1.fig
%      SCARA1, by itself, creates a new SCARA1 or raises the existing
%      singleton*.
%
%      H = SCARA1 returns the handle to a new SCARA1 or the handle to
%      the existing singleton*.
%
%      SCARA1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCARA1.M with the given input arguments.
%
%      SCARA1('Property','Value',...) creates a new SCARA1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SCARA1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SCARA1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SCARA1

% Last Modified by GUIDE v2.5 12-Dec-2023 16:56:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SCARA1_OpeningFcn, ...
                   'gui_OutputFcn',  @SCARA1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SCARA1 is made visible.
function SCARA1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SCARA1 (see VARARGIN)
global robot_scara
global pre_theta1;
global pre_theta2;
global pre_d3;
global pre_theta4; 
robot_scara=ROBOT(handles,0,45,0,0);
pre_theta1 = 0;
pre_theta2 = 45;
pre_theta4 = 0;
pre_d3 = 0;
robot_scara.theta(1)=0;
robot_scara.theta(2)=45;
robot_scara.theta(4)=0;
robot_scara.d(3)=0;
% Choose default command line output for SCARA1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.panel_qva,'Visible','On');
%set(handles.panel_1,'Visible','Off');
DrawRobot(robot_scara,handles);
rotate3d(handles.robot_plot, 'on');
% UIWAIT makes SCARA1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SCARA1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t1_FW;
t1_FW=get(handles.slider1, 'Value');
set(handles.edit_FW1,'string',num2str(t1_FW));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t2_FW;
t2_FW=get(handles.slider2, 'Value');
set(handles.edit_FW2,'string',num2str(t2_FW));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global d3_FW;
d3_FW=get(handles.slider3, 'Value');
set(handles.edit_FW3,'string',num2str(d3_FW));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global t4_FW;
t4_FW = get(handles.slider4, 'Value');
set(handles.edit_FW4,'string',num2str(t4_FW));

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global robot_scara;
global theta1;
global theta2;
global theta4;
global d3;
global pre_theta1;
global pre_theta2;
global pre_d3;
global pre_theta4;
global theta1_FW;
global theta2_FW;
global theta4_FW;
global d3_FW;
global p4;
global o4;
theta1 = str2double(get(handles.edit_FW1,'String'));
theta2 = str2double(get(handles.edit_FW2,'String'));
d3 = str2double(get(handles.edit_FW3,'String'));
theta4 = str2double(get(handles.edit_FW4,'String'));
theta1_FW = linspace(pre_theta1,theta1,20);
theta2_FW = linspace(pre_theta2,theta2,20);
theta4_FW = linspace(pre_theta4,theta4,20);
d3_FW = linspace(pre_d3, d3, 20) ;  
 
  for i = 1:20
  theta1 = theta1_FW(i);
  theta2 = theta2_FW(i);
  d3 = d3_FW(i);
  theta4 = theta4_FW(i);
  robot_scara=ROBOT(handles,theta1,theta2,d3,theta4);
  robot_scara.forwardKinematics();
  DrawRobot(robot_scara,handles);
  pause(0.01);
  end
  
%   for i = 1:20
%   theta2 = theta2_FW(i);
%   robot_scara=ROBOT(handles,theta1,theta2,d3,theta4);
%   robot_scara.forwardKinematics();
%   DrawRobot(robot_scara,handles);
%   pause(0.01);
%   end
%  % % 
%    for i = 1:20
%    d3 = d3_FW(i);
%    robot_scara=ROBOT(handles,theta1,theta2,d3,theta4);
%    robot_scara.forwardKinematics();
%   DrawRobot(robot_scara,handles);
%    pause(0.01);
%    end
%  % % 
%    for i = 1:20
%    theta4 = theta4_FW(i);
%    robot_scara=ROBOT(handles,theta1,theta2,d3,theta4);
%    robot_scara.forwardKinematics();
%    DrawRobot(robot_scara,handles);
%    pause(0.01);
%    end
robot_scara=ROBOT(handles,theta1,theta2,d3,theta4);
pre_theta1 = theta1;
pre_theta2 = theta2;
pre_theta4 = theta4;
pre_d3 = d3;
matrix_DH  =[robot_scara.a robot_scara.alpha robot_scara.d robot_scara.theta];
set(handles.DH_table,'Data',matrix_DH);

p4 = robot_scara.pos(4,:);
set(handles.edit11, 'String', num2str(p4(1)));
set(handles.edit2,'string', num2str(p4(2)));
set(handles.edit3,'string', num2str(p4(3)));

o4 = robot_scara.orien(4,:);
set(handles.edit6,'string', num2str(o4(3)*180/pi));

% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global x_IV;
x_IV=get(handles.slider5, 'Value');
set(handles.text_x,'string',num2str(x_IV));

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global y_IV;
y_IV=get(handles.slider6, 'Value');
set(handles.text_y,'string',num2str(y_IV));

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global z_IV;
z_IV=get(handles.slider7, 'Value');
set(handles.text_z,'string',num2str(z_IV));

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global si_IV;
si_IV=get(handles.slider8, 'Value');
set(handles.text_si,'string',num2str(si_IV));

% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    global x;
    global y;
    global z;
    global si;
    global theta1_IV;
    global theta2_IV;
    global theta4_IV;
    global d3_IV;
    global pre_theta1;
    global pre_theta2;
    global pre_d3;
    global pre_theta4;
    global theta1;
    global theta2;
    global theta4;
    global d3;
    global robot_scara;
    % Retrieve values from GUI
    x = str2double(get(handles.edit_x, 'String'));
    y = str2double(get(handles.edit_y, 'String'));
    z = str2double(get(handles.edit_z, 'String'));
    si = str2double(get(handles.edit_si, 'String'));
    if sqrt(x^2+y^2) > 0.5 || sqrt(x^2+y^2) < 0.1 || (z > 0.179 || z < 0.029)
    msgbox('Out of workspace','Error','error');
    return
    else
    % Calculate inverse kinematics
    [theta1_IV, theta2_IV, d3_IV, theta4_IV] = inverseKinematics(x, y, z, si);
    end

    
    theta1 = linspace(pre_theta1,theta1_IV,20)
    theta2 = linspace(pre_theta2,theta2_IV,20)
    theta4 = linspace(pre_theta4,theta4_IV,20)
    d3 = linspace(pre_d3, d3_IV, 20) 

    % Update robot configuration
    for i = 1:20
    theta1_IV = theta1(i);
    theta2_IV = theta2(i);
    d3_IV = d3(i);
    theta4_IV = theta4(i);
    robot_scara=ROBOT(handles,theta1_IV,theta2_IV,d3_IV,theta4_IV);
    robot_scara.forwardKinematics();
    DrawRobot(robot_scara,handles);
    pause(0.01);
    end
    
    % Display the DH parameters in a table
    
    robot_scara=ROBOT(handles,theta1_IV,theta2_IV,d3_IV,theta4_IV);
    pre_theta1 = theta1_IV;
    pre_theta2 = theta2_IV;
    pre_theta4 = theta4_IV;
    pre_d3 = d3_IV;
    matrix_DH  =[robot_scara.a robot_scara.alpha robot_scara.d robot_scara.theta];
    set(handles.DH_table,'Data',matrix_DH);

    p4 = robot_scara.pos(4,:);
    set(handles.edit11, 'String', num2str(p4(1)));
    set(handles.edit2,'string', num2str(p4(2)));
    set(handles.edit3,'string', num2str(p4(3)));
    o4 = robot_scara.orien(4,:);
    set(handles.edit6,'string', num2str(o4(3)*180/pi));
    
    set(handles.edit_x, 'String', '');
    set(handles.edit_y, 'String', '');
    set(handles.edit_z, 'String', '');
    set(handles.edit_si, 'String', '');


function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x as text
%        str2double(get(hObject,'String')) returns contents of edit_x as a double


% --- Executes during object creation, after setting all properties.
function edit_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y as text
%        str2double(get(hObject,'String')) returns contents of edit_y as a double


% --- Executes during object creation, after setting all properties.
function edit_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_z as text
%        str2double(get(hObject,'String')) returns contents of edit_z as a double


% --- Executes during object creation, after setting all properties.
function edit_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_si_Callback(hObject, eventdata, handles)
% hObject    handle to edit_si (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_si as text
%        str2double(get(hObject,'String')) returns contents of edit_si as a double


% --- Executes during object creation, after setting all properties.
function edit_si_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_si (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_v_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_v_max as text
%        str2double(get(hObject,'String')) returns contents of edit_v_max as a double


% --- Executes during object creation, after setting all properties.
function edit_v_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_max_Callback(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_max as text
%        str2double(get(hObject,'String')) returns contents of a_max as a double


% --- Executes during object creation, after setting all properties.
function a_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global x;
    global y;
    global z;
    global si;
    global theta1_IV;
    global theta2_IV;
    global theta4_IV;
    global d3_IV;
    global pre_theta1;
    global pre_theta2;
    global pre_d3;
    global pre_theta4;
    global theta1;
    global theta2;
    global theta4;
    global d3;
    global v_max;
    global a_max;
    global robot_scara;   
    
    global theta1_q theta1_v theta1_a
    global theta2_q theta2_v theta2_a
    global theta4_q theta4_v theta4_a
    global d3_q d3_v d3_a
    global time_theta1 time_theta2 time_d3 time_theta4



    % Retrieve values from GUI
    x = str2double(get(handles.edit_x, 'String'));
    y = str2double(get(handles.edit_y, 'String'));
    z = str2double(get(handles.edit_z, 'String'));
    a_max=str2double(get(handles.a_max, 'String'));
    v_max=str2double(get(handles.edit_v_max, 'String'));
    si = str2double(get(handles.edit_si, 'String'));
   
    if sqrt(x^2+y^2) > 0.5 || sqrt(x^2+y^2) < 0.1 || (z > 0.179 || z < 0.029)
         msgbox('Out of workspace','Error','error');
        return
        else
        % Calculate inverse kinematics
        [theta1_IV, theta2_IV, d3_IV, theta4_IV] = inverseKinematics(x,y,z,si);
    end
    
    q_max_theta1 = deg2rad(theta1_IV - pre_theta1);
    q_max_theta2 = deg2rad(theta2_IV - pre_theta2);
    q_max_d3 = d3_IV - pre_d3;
    q_max_theta4 = deg2rad(wrapTo360(theta4_IV - pre_theta4));  
    
    if handles.btn_S.Value == 1
        [time_theta1,theta1_q,theta1_v,theta1_a] = S_curve_Trajectory(q_max_theta1,v_max,a_max,deg2rad(pre_theta1));
        [time_theta2,theta2_q,theta2_v,theta2_a] = S_curve_Trajectory(q_max_theta2,v_max,a_max,deg2rad(pre_theta2));
        [time_d3,d3_q,d3_v,d3_a] = S_curve_Trajectory(q_max_d3,v_max,a_max,pre_d3);
        [time_theta4,theta4_q,theta4_v,theta4_a] = S_curve_Trajectory(q_max_theta4,v_max,a_max,deg2rad(pre_theta4));
    else
        [time_theta1,theta1_q,theta1_v,theta1_a] = LSPB_trajectory(q_max_theta1,v_max,a_max,deg2rad(pre_theta1));
        [time_theta2,theta2_q,theta2_v,theta2_a] = LSPB_trajectory(q_max_theta2,v_max,a_max,deg2rad(pre_theta2));
        [time_d3,d3_q,d3_v,d3_a] = LSPB_trajectory(q_max_d3,v_max,a_max,deg2rad(pre_d3));
        [time_theta4,theta4_q,theta4_v,theta4_a] = LSPB_trajectory(q_max_theta4,v_max,a_max,deg2rad(pre_theta4));
    end


for i = 1:length(time_theta1)
    theta1 = rad2deg(theta1_q(i));
    theta2 = rad2deg(theta2_q(i));
    d3 = d3_q(i);
    theta4 = rad2deg(theta4_q(i));
    robot_scara=ROBOT(handles,theta1,theta2,d3,theta4);
    robot_scara.forwardKinematics();
    DrawRobot(robot_scara,handles);
    pause(0.01);
    
    
    plot(handles.theta1_axes, time_theta1(1:i), theta1_q(1:i),'LineWidth',2,'color','b');
    plot(handles.theta2_axes, time_theta2(1:i), theta2_q(1:i),'LineWidth',2,'color','b');
    plot(handles.d3_axes, time_d3(1:i), d3_q(1:i),'LineWidth',2,'color','b');
    plot(handles.theta4_axes, time_theta4(1:i),theta4_q(1:i),'LineWidth',2,'color','b');
    plot(handles.theta1dot_axes, time_theta1(1:i), theta1_v(1:i),'LineWidth',2,'color','b');
    plot(handles.theta2dot_axes, time_theta2(1:i), theta2_v(1:i),'LineWidth',2,'color','b');
    plot(handles.d3dot_axes, time_d3(1:i), d3_v(1:i),'LineWidth',2,'color','b');
    plot(handles.theta4dot_axes, time_theta4(1:i), theta4_v(1:i),'LineWidth',2,'color','b');
    plot(handles.theta12dot_axes, time_theta1(1:i), theta1_a(1:i),'LineWidth',2,'color','b');
    plot(handles.theta22dot_axes, time_theta2(1:i), theta2_a(1:i),'LineWidth',2,'color','b');
    plot(handles.d32dot_axes, time_d3(1:i), d3_a(1:i),'LineWidth',2,'color','b');
    plot(handles.theta42dot_axes, time_theta4(1:i), theta4_a(1:i),'LineWidth',2,'color','b');
end
    
    % Display the DH parameters in a table
    matrix_DH  =[robot_scara.a robot_scara.alpha robot_scara.d robot_scara.theta];
    set(handles.DH_table,'Data',matrix_DH);

    p4 = robot_scara.pos(4,:);
    set(handles.edit11, 'String', num2str(p4(1)));
    set(handles.edit2,'string', num2str(p4(2)));
    set(handles.edit3,'string', num2str(p4(3)));
    o4 = robot_scara.orien(4,:);
    set(handles.edit6,'string', num2str(o4(3)*180/pi));




% --- Executes on button press in btn_S.
function btn_S_Callback(hObject, eventdata, handles)
% hObject    handle to btn_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.btn_L,'Value',0);
% Hint: get(hObject,'Value') returns toggle state of btn_S


% --- Executes on button press in btn_L.
function btn_L_Callback(hObject, eventdata, handles)
% hObject    handle to btn_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.btn_S,'Value',0);
% Hint: get(hObject,'Value') returns toggle state of btn_L


% --- Executes on button press in btn_qva.
function btn_qva_Callback(hObject, eventdata, handles)
% hObject    handle to btn_qva (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panel_qva,'Visible','On');
set(handles.panel_1,'Visible','Off');

% --- Executes on button press in btn_panel1.
function btn_panel1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_panel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panel_qva,'Visible','Off');
set(handles.panel_1,'Visible','On');



function edit_FW1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FW1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t1_FW;
t1_FW = get(handles.edit_FW1, 'string');
t1_FW = str2num(t1_FW);
set(handles.slider1,'Value',t1_FW);
% Hints: get(hObject,'String') returns contents of edit_FW1 as text
%        str2double(get(hObject,'String')) returns contents of edit_FW1 as a double


% --- Executes during object creation, after setting all properties.
function edit_FW1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FW1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_FW2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t2_FW;
t2_FW = get(handles.edit_FW2, 'string');
t2_FW = str2num(t2_FW);
% Hints: get(hObject,'String') returns contents of edit_FW2 as text
%        str2double(get(hObject,'String')) returns contents of edit_FW2 as a double


% --- Executes during object creation, after setting all properties.
function edit_FW2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_FW3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d3_FW;
d3_FW = get(handles.edit_FW3, 'string');
d3_FW = str2num(d3_FW);
% Hints: get(hObject,'String') returns contents of edit_FW3 as text
%        str2double(get(hObject,'String')) returns contents of edit_FW3 as a double


% --- Executes during object creation, after setting all properties.
function edit_FW3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_FW4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FW4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t4_FW;
t4_FW = get(handles.edit_FW4, 'string');
t4_FW = str2num(t4_FW);
% Hints: get(hObject,'String') returns contents of edit_FW4 as text
%        str2double(get(hObject,'String')) returns contents of edit_FW4 as a double


% --- Executes during object creation, after setting all properties.
function edit_FW4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FW4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
