function varargout = GUI_Laser(varargin)
% GUI_LASER MATLAB code for GUI_Laser.fig
%      GUI_LASER, by itself, creates a new GUI_LASER or raises the existing
%      singleton*.
%
%      H = GUI_LASER returns the handle to a new GUI_LASER or the handle to
%      the existing singleton*.
%
%      GUI_LASER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_LASER.M with the given input arguments.
%
%      GUI_LASER('Property','Value',...) creates a new GUI_LASER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Laser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Laser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Laser

% Last Modified by GUIDE v2.5 04-Nov-2016 13:42:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Laser_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Laser_OutputFcn, ...
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


% --- Executes just before GUI_Laser is made visible.
function GUI_Laser_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Laser (see VARARGIN)

% Choose default command line output for GUI_Laser
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Laser wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Laser_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
GUI;


% --- Executes on button press in Eye.
function Eye_Callback(hObject, eventdata, handles)
% hObject    handle to Eye (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
GUI_Laser_eyediagram;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global laser_t;
global laser_Eout;
global laser_Pout;
global laser_testSequenceData;

switch get(hObject,'Value')
    case 2  % Test sequence
        axes(handles.axes1)
        plot(laser_testSequenceData)
        xlabel('sample number (n)');
        ylabel('Test sequence (bits)');
        title('Current (PIN laser)');
    case 3  % Electric field's module
        axes(handles.axes1)
        plot(laser_t,abs(laser_Eout)) 
        xlabel('time (t)');
        ylabel('Electric field (N/C)');
        title('mod(Electric field) (PIN laser)');
    case 4  % Electric field's phase
        axes(handles.axes1)
        plot(laser_t,angle(laser_Eout).*(180/pi)) 
        xlabel('time (t)');
        ylabel('Phase (rad)');
        title('phase(Electric field) (PIN laser)');
    case 5  % Current deviation
        axes(handles.axes1)
        plot(laser_t,(laser_Pout)) 
        xlabel('time (t)');
        ylabel('Power (W)');
        title('Power (PIN laser)');
    case 6  % Current deviation
        axes(handles.axes1)
        plot(laser_t,(laser_Pout/max(laser_Pout))) 
        xlabel('time (t)');
        ylabel('Power (W)');
        title('Normalized Power (PIN laser)');
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
GUI;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
GUI_Laser_eyediagram;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
GUI_Laser_TF;