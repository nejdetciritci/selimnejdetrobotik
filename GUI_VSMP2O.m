function varargout = GUI_VSMP2O(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_VSMP2O_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_VSMP2O_OutputFcn, ...
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


function GUI_VSMP2O_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_VSMP2O (see VARARGIN)

handles.output = hObject;

guidata(hObject, handles);


jinit=[90;60;-120];
assignin('base','jinit',jinit); 

axes(handles.axes1);
FKdraw(jinit(1,1),jinit(2,1),jinit(3,1));
ax_properties = get(gca);
assignin('base','pov',ax_properties.View);

function varargout = GUI_VSMP2O_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


varargout{1} = handles.output;
%% FK
function pushbutton1_Callback(hObject, eventdata, handles)
axes(handles.axes1);
jinit=evalin('base','jinit');
FKdraw(jinit(1,1),jinit(2,1),jinit(3,1));
set( handles.text1,'String', num2str(90) );
set( handles.text2,'String', num2str(60) );
set( handles.text3,'String', num2str(-120) );

function slider1_Callback(hObject, eventdata, handles)
val2=str2num(get(handles.text2,'String'));
val3=str2num(get(handles.text3,'String'));
val1 = get(hObject,'Value') ;
val=[val1;val2;val3];
assignin('base','val',val);
set( handles.text1,'String', num2str(val1,3) );
axes(handles.axes1);
FKdraw(val1,val2,val3);
view(evalin('base','pov'));


function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider2_Callback(hObject, eventdata, handles)
val1=str2num(get(handles.text1,'String'));
val3=str2num(get(handles.text3,'String'));
val2 = get(hObject,'Value') ;
val=[val1;val2;val3];
assignin('base','val',val);
set(handles.text2,'String', num2str(val2,3));
axes(handles.axes1);
FKdraw(val1,val2,val3);
view(evalin('base','pov'));

function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider3_Callback(hObject, eventdata, handles)
val1=str2num(get(handles.text1,'String'));
val2=str2num(get(handles.text2,'String'));
val3 = get(hObject,'Value') ;
val=[val1;val2;val3];
assignin('base','val',val);
set( handles.text3,'String', num2str(val3,3) );
axes(handles.axes1);
FKdraw(val1,val2,val3);
view(evalin('base','pov'));


function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
