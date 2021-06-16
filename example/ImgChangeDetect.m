function varargout = ImgChangeDetect(varargin)
% IMGCHANGEDETECT MATLAB code for ImgChangeDetect.fig
%      IMGCHANGEDETECT, by itself, creates a new IMGCHANGEDETECT or raises the existing
%      singleton*.
%
%      H = IMGCHANGEDETECT returns the handle to a new IMGCHANGEDETECT or the handle to
%      the existing singleton*.
%
%      IMGCHANGEDETECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMGCHANGEDETECT.M with the given input arguments.
%
%      IMGCHANGEDETECT('Property','Value',...) creates a new IMGCHANGEDETECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImgChangeDetect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImgChangeDetect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImgChangeDetect

% Last Modified by GUIDE v2.5 03-Dec-2014 19:30:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImgChangeDetect_OpeningFcn, ...
                   'gui_OutputFcn',  @ImgChangeDetect_OutputFcn, ...
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


% --- Executes just before ImgChangeDetect is made visible.
function ImgChangeDetect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImgChangeDetect (see VARARGIN)

% Choose default command line output for ImgChangeDetect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImgChangeDetect wait for user response (see UIRESUME)
% uiwait(handles.figure_main);


% --- Outputs from this function are returned to the command line.
function varargout = ImgChangeDetect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_open1.
function pushbutton_open1_Callback(hObject, eventdata, handles)
%图像文件的打开
[fname, pname] = uigetfile({ '*.bmp';'*.tif';'*.jpg'}, '选择图片');
if isequal(fname,0)||isequal(pname,0)
    return;
else
    srcFile = [pname fname];
    img1 = imread(srcFile);
    axes(handles.axes_src1);
    imshow(img1);
    title('变化前图像');
    % 保存图像1
    handles.img_src1 = img1;
    guidata(hObject,handles);
end
    
% --- Executes on button press in pushbutton_open2.
function pushbutton_open2_Callback(hObject, eventdata, handles)
%图像文件的打开
[fname, pname] = uigetfile({ '*.bmp';'*.tif';'*.jpg'}, '选择图片');
if isequal(fname,0)||isequal(pname,0)
    return;
else
    srcFile = [pname fname];
    img2 = imread(srcFile);
    axes(handles.axes_src2);
    imshow(img2);
    title('变化后图像');
    % 保存图像2
    handles.img_src2 = img2;
    guidata(hObject,handles);
end

% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% 保存结果图像
[fname, pname] = uiputfile({'*.bmp';'*.tif';'*.jpg' }, '保存图片为');
if isequal(fname,0)||isequal(pname,0)
    return;
else
    fpath = fullfile(pname,fname);% 获取全路径
end
img_res = handles.img_res;
imwrite(img_res,fpath);

% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
% 程序退出
close(handles.figure_main);


function edit_nChange_Callback(hObject, eventdata, handles)
% hObject    handle to edit_nChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_nChange as text
%        str2double(get(hObject,'String')) returns contents of edit_nChange as a double


% --- Executes during object creation, after setting all properties.
function edit_nChange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_nChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pChange_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pChange as text
%        str2double(get(hObject,'String')) returns contents of edit_pChange as a double


% --- Executes during object creation, after setting all properties.
function edit_pChange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel_methods.
function uipanel_methods_SelectionChangeFcn(hObject, eventdata, handles)
% 响应不同的变化检测方法
img1 = handles.img_src1;
img2 = handles.img_src2;
switch get(hObject,'Tag')
    case 'radiobutton_ratio'
        % 对话框输入阈值
        prompt = {'输入差异性阈值（0-1）'};
        title = '设置阈值';
        def = {'0.8'};
        lines = 1;
        answer = inputdlg(prompt,title,lines,def);
        threshold = answer{1};   
        threshold = str2num(threshold);
        % 开始检测
        [img_res,nChange] = changedetect(img1,img2,'ratio',threshold);
    case 'radiobutton_norm'
        % 对话框输入阈值
        prompt = {'输入差异性阈值（0-1）'};
        title = '设置阈值';
        def = {'0.4'};
        lines = 1;
        answer = inputdlg(prompt,title,lines,def);
        threshold = answer{1};   
        threshold = str2num(threshold);
        % 开始检测
        [img_res,nChange] = changedetect(img1,img2,'norm',threshold);
    case 'radiobutton_corrcoef'
         % 对话框输入阈值
        prompt = {'输入差异性阈值（0-1）'};
        title = '设置阈值';
        def = {'0.4'};
        lines = 1;
        answer = inputdlg(prompt,title,lines,def);
        threshold = answer{1}; 
        threshold = str2num(threshold);
        % 开始检测
        [img_res,nChange] = changedetect(img1,img2,'corrcoef',threshold);
end
axes(handles.axes_res);
imshow(img_res);
handles.img_res = img_res;
guidata(hObject,handles);
set(handles.edit_nChange,'string',num2str(nChange));
[m,n] = size(img1);
pChange = nChange/(m*n);
set(handles.edit_pChange,'string',num2str(pChange));
