function varargout = gui_cw(varargin)
% GUI_CW MATLAB code for gui_cw.fig
%      GUI_CW, by itself, creates a new GUI_CW or raises the existing
%      singleton*.
%
%      H = GUI_CW returns the handle to a new GUI_CW or the handle to
%      the existing singleton*.
%
%      GUI_CW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_CW.M with the given input arguments.
%
%      GUI_CW('Property','Value',...) creates a new GUI_CW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_cw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_cw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_cw

% Last Modified by GUIDE v2.5 29-May-2021 04:06:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_cw_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_cw_OutputFcn, ...
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


% --- Executes just before gui_cw is made visible.
function gui_cw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_cw (see VARARGIN)

% Choose default command line output for gui_cw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_cw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_cw_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
imshow('stance.jpg');
title('Orignal Image');


axes(handles.axes2);
im = imread('stance.jpg');
g = rgb2gray(im);
e = edge(g,'sobel');
imshow(e);
title('Sobel');

axes(handles.axes3);
im = imread('stance.jpg');
g = rgb2gray(im);
e = edge(g,'log');
imshow(e);
title('Log');

axes(handles.axes4);
im = imread('stance.jpg');
g = rgb2gray(im);
e = edge(g,'canny');
imshow(e);
title('Canny');


axes(handles.axes5);
im = imread('stance.jpg');
im_b = imgaussfilt(im,1);
im_s = imsharpen(im_b);
g= rgb2gray(im_b);
e= edge(g,'roberts');
P= edge(e,'nothinning');

P(1130:1200,1:910)=0;
P(400:1200,1:190)=0;
P(1:1200,670:899)=0;

P(1000:1200,310:550)=0;
P(1:650,700:1200)=0;
P(1:1200,1047:1200)=0;

P(1160:1200,1000:1200)=0;
P(1180:1200,900:1200)=0;
P(1120:1200,190:700)=0;
 P(1165:1200,1:931)=0;

CR7= imread('sign.jpg');
for row = 1:200
for col = 1:300
if CR7(row,col,1)<10
P(row,col,:)=200;
end
end
end
imshow(P, 'ColorMap', [0 0 0; 1 0 0]);
title('Edge');
% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
str = get(hObject, 'String');
val = get(hObject, 'Value');

switch str{val}
    case 'Edge'
        im = imread('stance.jpg');
        im_b = imgaussfilt(im,1);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1130:1200,1:910)=0;
        P(400:1200,1:190)=0;
        P(1:1200,670:899)=0;
        P(1000:1200,310:550)=0;
        P(1:650,700:1200)=0;
        P(1:1200,1047:1200)=0;
        P(1160:1200,1000:1200)=0;
        P(1180:1200,900:1200)=0;
        P(1120:1200,190:700)=0;
        P(1165:1200,1:931)=0;
           imshow(P);
    case 'Signature'
        im = imread('stance.jpg');
        im_b = imgaussfilt(im,1);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1130:1200,1:910)=0;
        P(400:1200,1:190)=0;
        P(1:1200,670:899)=0;
        P(1000:1200,310:550)=0;
        P(1:650,700:1200)=0;
        P(1:1200,1047:1200)=0;
        P(1160:1200,1000:1200)=0;
        P(1180:1200,900:1200)=0;
        P(1120:1200,190:700)=0;
        P(1165:1200,1:931)=0;
        CR7= imread('sign.jpg');
        for row = 1:200
        for col = 1:300
        if CR7(row,col,1)<10
        P(row,col,:)=200;
        end
        end
        end
        imshow(P)
    case 'Color Edge'
           im = imread('stance.jpg');
        im_b = imgaussfilt(im,1);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1130:1200,1:910)=0;
        P(400:1200,1:190)=0;
        P(1:1200,670:899)=0;
        P(1000:1200,310:550)=0;
        P(1:650,700:1200)=0;
        P(1:1200,1047:1200)=0;
        P(1160:1200,1000:1200)=0;
        P(1180:1200,900:1200)=0;
        P(1120:1200,190:700)=0;
        P(1165:1200,1:931)=0;
        imshow(P, 'ColorMap', [0 0 0; 1 0 0]);
  
    case 'Color Signature'
         im = imread('stance.jpg');
        im_b = imgaussfilt(im,1);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1130:1200,1:910)=0;
        P(400:1200,1:190)=0;
        P(1:1200,670:899)=0;
        P(1000:1200,310:550)=0;
        P(1:650,700:1200)=0;
        P(1:1200,1047:1200)=0;
        P(1160:1200,1000:1200)=0;
        P(1180:1200,900:1200)=0;
        P(1120:1200,190:700)=0;
        P(1165:1200,1:931)=0;
        CR7= imread('sign.jpg');
        for row = 1:200
        for col = 1:300
        if CR7(row,col,1)<10
        P(row,col,:)=200;
        end
        end
        end
        imshow(P, 'ColorMap', [0 0 0; 1 0 0]);
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
axes(handles.axes1);
str = get(hObject, 'String');
val = get(hObject, 'Value');

switch str{val}
    case 'Pic stance'
        imshow('stance.jpg');
    case 'Pic shoot'
        imshow('shoot.jpg')
end
% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
imshow('shoot.jpg');

axes(handles.axes2);
im = imread('shoot.jpg');
g = rgb2gray(im);
e = edge(g,'sobel');
imshow(e);
title('Sobel');

axes(handles.axes3);
im = imread('shoot.jpg');
g = rgb2gray(im);
e = edge(g,'log');
imshow(e);
title('Log');

axes(handles.axes4);
im = imread('shoot.jpg');
g = rgb2gray(im);
e = edge(g,'canny');
imshow(e);
title('Canny');

axes(handles.axes5);
im = imread('shoot.jpg');
im_b = imgaussfilt(im,2);
im_s = imsharpen(im_b);
g= rgb2gray(im_b);
e= edge(g,'roberts');
P= edge(e,'nothinning');
P(310:2500,1:750)=0; 
P(640:680,850:920)=0;
P(1:700,750:980)=0;
P(1500:1900,750:980)=0;
P(1500:2500,750:890)=0;
P(1400:2000,700:980)=0;
P(1:2500,1930:3000)=0;
P(1300:2500,1570:3500)=0;
P(1800:2500,750:870)=0;
P(2125:2500,1:3500)=0;
P(1700:2500,1280:3500)=0;
P(1900:2500,1170:3500)=0;
P(1:2500,2500:3028)=0;

CR7= imread('sign2.jpg');
for row = 1:300
for col = 1:1250
if CR7(row,col,1)<10
P(row,col,:)=200;
end
end
end
imshow(P, 'ColorMap', [0 0 0; 1 0 0]);


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
axes(handles.axes5);
str = get(hObject, 'String');
val = get(hObject, 'Value');

switch str{val}
    case 'Edge'
        im = imread('shoot.jpg');
        im_b = imgaussfilt(im,2);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1:2500,1:750)=0; 
        P(640:680,850:920)=0;
        P(1:700,750:980)=0;
        P(1500:1900,750:980)=0;
        P(1500:2500,750:890)=0;
        P(1400:2000,700:980)=0;
        P(1:2500,1930:3000)=0;
        P(1300:2500,1570:3500)=0;
        P(1800:2500,750:870)=0;
        P(2125:2500,1:3500)=0;
        P(1700:2500,1280:3500)=0;
        P(1900:2500,1170:3500)=0;
        P(1:2500,2500:3028)=0;
        imshow(P);
    case 'Signature'   
        im = imread('shoot.jpg');
        im_b = imgaussfilt(im,2);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1:2500,1:750)=0; 
        P(640:680,850:920)=0;
        P(1:700,750:980)=0;
        P(1500:1900,750:980)=0;
        P(1500:2500,750:890)=0;
        P(1400:2000,700:980)=0;
        P(1:2500,1930:3000)=0;
        P(1300:2500,1570:3500)=0;
        P(1800:2500,750:870)=0;
        P(2125:2500,1:3500)=0;
        P(1700:2500,1280:3500)=0;
        P(1900:2500,1170:3500)=0;
        P(1:2500,2500:3028)=0;
        CR7= imread('sign2.jpg');
        for row = 1:300
        for col = 1:1250
        if CR7(row,col,1)<10
        P(row,col,:)=200; 
        end 
        end
        end
        imshow(P);
    case 'Color Edge'
             im = imread('shoot.jpg');
        im_b = imgaussfilt(im,2);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1:2500,1:750)=0; 
        P(640:680,850:920)=0;
        P(1:700,750:980)=0;
        P(1500:1900,750:980)=0;
        P(1500:2500,750:890)=0;
        P(1400:2000,700:980)=0;
        P(1:2500,1930:3000)=0;
        P(1300:2500,1570:3500)=0;
        P(1800:2500,750:870)=0;
        P(2125:2500,1:3500)=0;
        P(1700:2500,1280:3500)=0;
        P(1900:2500,1170:3500)=0;
        P(1:2500,2500:3028)=0;
        imshow(P, 'ColorMap', [0 0 0; 1 0 0]);
     case 'Color Signature'
         im = imread('shoot.jpg');
        im_b = imgaussfilt(im,2);
        im_s = imsharpen(im_b);
        g= rgb2gray(im_b);
        e= edge(g,'roberts');
        P= edge(e,'nothinning');
        P(1:2500,1:750)=0; 
        P(640:680,850:920)=0;
        P(1:700,750:980)=0;
        P(1500:1900,750:980)=0;
        P(1500:2500,750:890)=0;
        P(1400:2000,700:980)=0;
        P(1:2500,1930:3000)=0;
        P(1300:2500,1570:3500)=0;
        P(1800:2500,750:870)=0;
        P(2125:2500,1:3500)=0;
        P(1700:2500,1280:3500)=0;
        P(1900:2500,1170:3500)=0;
        P(1:2500,2500:3028)=0;
        CR7= imread('sign2.jpg');
        for row = 1:300
        for col = 1:1250
        if CR7(row,col,1)<10
        P(row,col,:)=200; 
        end 
        end
        end     
        imshow(P, 'ColorMap', [0 0 0; 1 0 0]);
end


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
