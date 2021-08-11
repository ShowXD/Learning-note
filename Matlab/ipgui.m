function varargout = ipgui(varargin)
% IPGUI MATLAB code for ipgui.fig
%      IPGUI, by itself, creates a new IPGUI or raises the existing
%      singleton*.
%
%      H = IPGUI returns the handle to a new IPGUI or the handle to
%      the existing singleton*.
%
%      IPGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IPGUI.M with the given input arguments.
%
%      IPGUI('Property','Value',...) creates a new IPGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ipgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ipgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ipgui

% Last Modified by GUIDE v2.5 02-Jan-2020 14:59:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ipgui_OpeningFcn, ...
                   'gui_OutputFcn',  @ipgui_OutputFcn, ...
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


% --- Executes just before ipgui is made visible.
function ipgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ipgui (see VARARGIN)

% Choose default command line output for ipgui
handles.output = hObject;
set(handles.output, 'Name', 'IPGUI - Image Processing');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ipgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ipgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Menu_File_Callback(~, ~, ~)
% hObject    handle to Menu_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_File_Open_Callback(hObject, ~, handles)
% 開啟檔案 (Open File)
[handles.FileName,handles.PathName,filterindex] = uigetfile( ...
{ '*.bmp;*.jpg;*.jpeg;*.pbm;*.pgm;*.png;*.ppm;*.tif;*.tiff',...
'Image Files (*.bmp;*.jpg;*.jpeg;*.pbm;*.pgm;*.png;*.ppm;*.tif;*.tiff)';
'*.bmp','Windows Bitmap (*.bmp)';...
'*.jpg;*.jpeg','JPEG (*.jpg;*.jpeg)';...
'*.pbm','Portable Bitmap (*.pbm)';...
'*.pgm','Portable Graymap (*.pgm)';...
'*.png','Portable Network Graphics (*.png)';...
'*.ppm','Portable Pixmap (*.ppm)';...
'*.tif;*.tiff','Tagged Image File Format (*.tif;*.tiff)';...
'*.img','Analyze Format image (*.img)';...
'*.mat','MATLAB format files (*.mat)'},...
'Select an Image File to Open');


if (handles.FileName)==0
    return
else
    % Analized image open
    if (filterindex < 9)
        % Read in image
        handles.img = imread([handles.PathName, handles.FileName]);
        handles.result = handles.img;
        % Show image
        set(ipgui,'CurrentAxes',handles.axes1 );
        imshow(uint8(handles.img));
        
        % Get and show image information
        [handles.rows handles.cols handles.dim] = size(handles.img);
        info = imfinfo([handles.PathName,handles.FileName]);
        handles.bitdepth = info.BitDepth;
        handles.ColorType = info.ColorType;
        info_str = cell(7,1);
        info_str{1} = strcat('Image Width:', num2str(info.Width));
        info_str{2} = strcat('Image Height:', num2str(info.Height));
        info_str{3} = strcat('Image Dimension:', num2str(handles.dim));
        info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
        info_str{5} = strcat('Max. Value:', num2str(max(handles.img(:))));
        info_str{6} = strcat('Min. Value:', num2str(min(handles.img(:))));
        info_str{7} = strcat('ColorType:', handles.ColorType);
        set(handles.text1,'String', info_str);
        
    elseif filterindex == 9
        % Read in medical image
        handles.ana = analyze75read([handles.PathName, handles.FileName]);
        handles.ana = flipdim(handles.ana,1);
        [rows cols dim] = size(handles.ana);
        handles.img = handles.ana(:,:,round(dim/2));
        % Show image
        set(ipgui,'CurrentAxes',handles.axes1 );
        imshow(handles.img);
        % Enable functions
        set(handles.uipanel4,'Visible','on');
        set(handles.slider8,'Max',dim);
        set(handles.slider8,'Min',1);
        set(handles.slider8,'SliderStep',[1/(dim-1) 10/(dim-1)]);
        set(handles.slider8,'Value',round(dim/2));
        set(handles.edit8,'String',round(dim/2));
    elseif filterindex == 10
        load([handles.PathName, handles.FileName]);
        handles.ana = [];
        handles.ana = data;
        [rows cols dim] = size(handles.ana);
        handles.img = handles.ana(:,:,round(dim/2));
        
        % Show image
        set(ipgui,'CurrentAxes',handles.axes1 );
        imshow(handles.img);
        
        % Enable functions
        set(handles.uipanel4,'Visible','on');
        set(handles.slider8,'Max',dim);
        set(handles.slider8,'Min',1);
        set(handles.slider8,'SliderStep',[1/(dim-1) 10/(dim-1)]);
        set(handles.slider8,'Value',round(dim/2));
        set(handles.edit8,'String',round(dim/2));

    end
    % Enable functions
    set(handles.Menu_File_Save,'Enable','on');
    
    % Enable Conv funtions
    set(handles.Menu_Conv,'Enable','on');
    
    % Store the variable data as GUI data
    guidata(hObject,handles);
end



% --------------------------------------------------------------------
function Menu_File_Save_Callback(hObject, eventdata, handles)
% 儲存檔案 (Save File)
[filename, pathname, filterindex] = uiputfile( ...
{ '*.bmp','Windows Bitmap (*.bmp)'; ...
'*.jpg','JPEG (*.jpg)'; ...
'*.pbm','Portable Bitmap (*.pbm)'; ...
'*.pgm','Portable Graymap (*.pgm)'; ...
'*.png','Portable Network Graphics (*.png)'; ...
'*.ppm','Portable Pixmap (*.ppm)'; ...
'*.tif','Tagged Image File Format (*.tif)'; ...
'*.mat','MATLAB format files (*.mat)'}, ...
'Save Image as',...
'untitled');

% 分辨格式
if (filename)==0
    return
else
    if filterindex~=8
        fmt(1,:)='bmp';
        fmt(2,:)='jpg';
        fmt(3,:)='pbm';
        fmt(4,:)='pgm';
        fmt(5,:)='png';
        fmt(6,:)='ppm';
        fmt(7,:)='tif';
        
        % Write out image
        imwrite(handles.result, [pathname, filename], fmt(filterindex,:));
    elseif filterindex == 8
        cd(pathname);
        data = handles.seg;
        save(filename, 'data');
    end
end


% --------------------------------------------------------------------
function Menu_File_Exit_Callback(~, ~, ~)
close(ipgui);


% --------------------------------------------------------------------
function Menu_Watermaking_Callback(~, ~, ~)
% hObject    handle to Menu_Watermaking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Water_bitplane_Callback(~, ~, handles)
% 位元平面
if (handles.dim) == 1 && (handles.bitdepth) == 8 % Grayscale image
    
 % Extract bitplane image
 for i=1:8
     imgbp(:,:,i) = bitget(handles.img,i);
 end
 % Show image
 SI = figure;
 figure(SI);
 for i = 1:8
     subplot(2,4,i);
     imshow(imgbp(:,:,i), []);
     title(['Bitplane ', num2str(i)]);
 end
 
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 %RGB
 for i = 1:24
     band = floor((i-1)/8) + 1;
     bitinband = i - 8*(band-1);
     bitarrays{i} = bitget(handles.img(:,:,band), bitinband);
 end
 
 % Show image
 SI = figure;
 figure(SI);
 for i = 1:24
     subplot(3, 8, i);
     imshow(bitarrays{i}, []);
     title(['Bitplane', num2str(i)])
 end
else
    
 % Send the Warning
 warndlg('The image is not an 8-bit grayscale image.','Warning')
 return
end


% --------------------------------------------------------------------
function Menu_Water_LSB_Callback(hObject, eventdata, handles)
% 開啟預藏的檔案
[FileName,PathName] = uigetfile( ...
    { '*.bmp;*.jpg;*.jpeg;*.pbm;*.pgm;*.png;*.ppm;*.tif;*.tiff',...
    'Image Files (*.bmp;*.jpg;*.jpeg;*.pbm;*.pgm;*.png;*.ppm;*.tif;*.tiff)';
    '*.bmp','Windows Bitmap (*.bmp)';...
    '*.jpg;*.jpeg','JPEG (*.jpg;*.jpeg)';...
    '*.pbm','Portable Bitmap (*.pbm)';...
    '*.pgm','Portable Graymap (*.pgm)';...
    '*.png','Portable Network Graphics (*.png)';...
    '*.ppm','Portable Pixmap (*.ppm)';...
    '*.tif;*.tiff','Tagged Image File Format (*.tif;*.tiff)';...
    '*.*', 'All Files (*.*)'},...
    'Select a Watermark Image to Open');

if (FileName)==0
    return
else
    if (handles.dim)==1 && (handles.bitdepth)==8 % Grayscale image
        % Read in watermark image
        water_img = imread([PathName,FileName]);
        water_info = imfinfo([PathName,FileName]);
        [rows cols dim] = size(water_img);
        
        if (water_info.BitDepth)==1 % Watermark is binary
            handles.result(1:rows,1:cols)=bitset(handles.img(1:rows,1:cols),1,water_img);
            
            % Show image
            set(ipgui,'CurrentAxes',handles.axes2)
            imshow(handles.result);
            
            % Compute and show PSNR
            mse = sum(sum((double(handles.img)-double(handles.result))^2))/(handles.rows*handles.cols);
            PSNR = 10*log10(255*255/mse);
            set(handles.text2,'String', strcat('PSNR=', num2str(PSNR), ' dB'));
            
            % Store the variable data as GUI data
            guidata(hObject,handles);
        else
            warndlg('The watermark image is not binary.','Warning')
            return
        end
    else
        warndlg('The source image is not an 8-bit grayscale image.','Warning')
        return
    end
end


% --------------------------------------------------------------------
function Menu_PP_Callback(~, ~, ~)
% hObject    handle to Menu_PP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_PP_complement_Callback(hObject, ~, handles)
% 影像補色
handles.result = imcomplement(handles.img);

% 顯示圖片
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result);

% 抓取並顯示圖片資訊
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);

set(handles.text1,'String', info_str);

% 將變數資料轉成GUI資料來進行儲存
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_PP_histogram_Callback(~, ~, handles)
% 直方圖
if (handles.dim) == 1 % 灰階影像
    movegui(figure('Name','Answer','NumberTitle','off'),'center')
    plot(imhist(handles.img));
elseif (handles.dim) == 3 % RGB影像
    movegui(figure('Name','Answer','NumberTitle','off'),'center');
        % R直方圖
        subplot(2, 2, 1);
        plot(imhist(handles.img(:,:,1)));
        title("R");
        
        % G直方圖
        subplot(2, 2, 2);
        plot(imhist(handles.img(:,:,2)));
        title("G");
        
        % B直方圖
        subplot(2, 2, 3);
        plot(imhist(handles.img(:,:,3)));
        title("B");
        
        % RGB直方圖
        subplot(2, 2, 4);
        plot(imhist(handles.img(:,:,1)));
        hold on;
        plot(imhist(handles.img(:,:,2)));
        hold on;
        plot(imhist(handles.img(:,:,3)));
        title("RGB");
else
    warndlg('這張圖片不科學','Warning')
    return
end


% --------------------------------------------------------------------
function Menu_PP_stretching_Callback(hObject, ~, handles)
% image stretching
if (handles.dim) == 1 && (handles.bitdepth) == 8 % grayscale image
    handles.result = imadjust(handles.img);
    
    % show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
    
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB圖片
    YUV = rgb2ntsc(handles.img);
    Y = YUV(:,:,1);
    YUV(:,:,1) = imadjust(Y);
    handles.result = ntsc2rgb(YUV);
    
    % show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
else
    warndlg('The image cannot stretch.','Warning')
    return
end

% get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);

set(handles.text2,'String', info_str);

% store the variable data as GUI data
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_PP_equalization_Callback(hObject, eventdata, handles)
% image stretching
if (handles.dim) == 1 && (handles.bitdepth) == 8 % grayscale image
    handles.result = histeq(handles.img);
    
    % show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
    
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB圖片
    YUV = rgb2ntsc(handles.img);
    Y = YUV(:,:,1);
    YUV(:,:,1) = histeq(Y);
    handles.result = ntsc2rgb(YUV);
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
else
    warndlg('The image cannot stretch.','Warning')
    return
end

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);

set(handles.text2,'String', info_str);

% store the variable data as GUI data
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Filter_average_Callback(hObject, ~, handles)
% Create predefined 2-D filter
h = fspecial('average');
if (handles.dim) == 1 && (handles.bitdepth) == 8 % Grayscale image
    % Image 2-D digital filter
    handles.result = uint8(filter2(h, handles.img));
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
    
    % Get and show image information
    [rows, cols, dim] = size(handles.result);
    info_str = cell(7,1);
    info_str{1} = strcat('Image Width:', num2str(cols));
    info_str{2} = strcat('Image Height:', num2str(rows));
    info_str{3} = strcat('Image Dimension:', num2str(dim));
    info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
    info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
    info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
    info_str{7} = strcat('ColorType:', handles.ColorType);
    set(handles.text2,'String', info_str);
    
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB image
    
    % Show three image
    movegui(figure('Name','Answer','NumberTitle','off'),'center');
    handles.result = handles.img;
    for i = 1:3
        handles.result = uint8(filter2(h, handles.img(:,:,i)));
        subplot(2, 2, i);
        imshow(handles.result);
    end
    
    % Y filter
    YUV = rgb2ntsc(handles.img);
    Y = YUV(:,:,1);
    YUV(:,:,1) = filter2(h, Y);
    handles.result = ntsc2rgb(YUV);
    
    % Show the image that have been filter
    subplot(2, 2, 4);
    imshow(handles.result);
    
else
    
    % Send the warning
    warndlg('The image cannot be filtered.','Warning')
    return
end

% Store the variable data as GUI data
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_Filter_gaussian_Callback(hObject, ~, handles)
% Create predefined 2-D filter
h = fspecial('Gaussian');
if (handles.dim) == 1 && (handles.bitdepth) == 8 % Grayscale image
    % Image 2-D digital filter
    handles.result = uint8(filter2(h, handles.img));

elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB image
    
    % Show three image
    movegui(figure('Name','Answer','NumberTitle','off'),'center');
    handles.result = handles.img;
    for i = 1:3
        handles.result = uint8(filter2(h, handles.img(:,:,i)));
        subplot(2, 2, i);
        imshow(handles.result);
    end
    
    % Y filter
    YUV = rgb2ntsc(handles.img);
    Y = YUV(:,:,1);
    YUV(:,:,1) = filter2(h, Y);
    handles.result = ntsc2rgb(YUV);
    
    % Show the image that have been filter
    subplot(2, 2, 4);
    imshow(handles.result);
    
else
    
    % Send the warning
    warndlg('The image cannot be filtered.','Warning')
    return
end

    % Show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
    
    % Get and show image information
    [rows, cols, dim] = size(handles.result);
    info_str = cell(7,1);
    info_str{1} = strcat('Image Width:', num2str(cols));
    info_str{2} = strcat('Image Height:', num2str(rows));
    info_str{3} = strcat('Image Dimension:', num2str(dim));
    info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
    info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
    info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
    info_str{7} = strcat('ColorType:', handles.ColorType);
    set(handles.text2,'String', info_str);

    % Store the variable data as GUI data
    guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_Filter_laplacian_Callback(hObject, eventdata, handles)
% Create predefined 2-D filter
h = fspecial('Laplacian');
if (handles.dim) == 1 && (handles.bitdepth) == 8 % Grayscale image
    % Image 2-D digital filter
    handles.result = uint8(filter2(h, handles.img));
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
    
    % Get and show image information
    [rows, cols, dim] = size(handles.result);
    info_str = cell(7,1);
    info_str{1} = strcat('Image Width:', num2str(cols));
    info_str{2} = strcat('Image Height:', num2str(rows));
    info_str{3} = strcat('Image Dimension:', num2str(dim));
    info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
    info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
    info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
    info_str{7} = strcat('ColorType:', handles.ColorType);
    set(handles.text2,'String', info_str);
    
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB image
    
    % Show three image
    movegui(figure('Name','Answer','NumberTitle','off'),'center');
    handles.result = handles.img;
    for i = 1:3
        handles.result = uint8(filter2(h, handles.img(:,:,i)));
        subplot(2, 2, i);
        imshow(handles.result);
    end
    
    % Y filter
    YUV = rgb2ntsc(handles.img);
    Y = YUV(:,:,1);
    YUV(:,:,1) = filter2(h, Y);
    handles.result = ntsc2rgb(YUV);
    
    % Show the image that have been filter
    subplot(2, 2, 4);
    imshow(handles.result);
    
else
    
    % Send the warning
    warndlg('The image cannot be filtered.','Warning')
    return
end

% Store the variable data as GUI data
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_Filter_loG_Callback(hObject, eventdata, handles)
% Create predefined 2-D filter
h = fspecial('LoG');
if (handles.dim) == 1 && (handles.bitdepth) == 8 % Grayscale image
    % Image 2-D digital filter
    handles.result = uint8(filter2(h, handles.img));
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
    
    % Get and show image information
    [rows, cols, dim] = size(handles.result);
    info_str = cell(7,1);
    info_str{1} = strcat('Image Width:', num2str(cols));
    info_str{2} = strcat('Image Height:', num2str(rows));
    info_str{3} = strcat('Image Dimension:', num2str(dim));
    info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
    info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
    info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
    info_str{7} = strcat('ColorType:', handles.ColorType);
    set(handles.text2,'String', info_str);
    
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB image
    
    % Show three image
    movegui(figure('Name','Answer','NumberTitle','off'),'center');
    handles.result = handles.img;
    for i = 1:3
        handles.result = uint8(filter2(h, handles.img(:,:,i)));
        subplot(2, 2, i);
        imshow(handles.result);
    end
    
    % Y filter
    YUV = rgb2ntsc(handles.img);
    Y = YUV(:,:,1);
    YUV(:,:,1) = filter2(h, Y);
    handles.result = ntsc2rgb(YUV);
    
    % Show the image that have been filter
    subplot(2, 2, 4);
    imshow(handles.result);
    
else
    
    % Send the warning
    warndlg('The image cannot be filtered.','Warning')
    return
end

% Store the variable data as GUI data
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_Filter_unsharp_Callback(hObject, eventdata, handles)
% Create predefined 2-D filter
h = fspecial('unsharp');
if (handles.dim) == 1 && (handles.bitdepth) == 8 % Grayscale image
    % Image 2-D digital filter
    handles.result = uint8(filter2(h, handles.img));
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.result);
    
    % Get and show image information
    [rows, cols, dim] = size(handles.result);
    info_str = cell(7,1);
    info_str{1} = strcat('Image Width:', num2str(cols));
    info_str{2} = strcat('Image Height:', num2str(rows));
    info_str{3} = strcat('Image Dimension:', num2str(dim));
    info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
    info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
    info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
    info_str{7} = strcat('ColorType:', handles.ColorType);
    set(handles.text2,'String', info_str);
    
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB image
    
    % Show three image
    movegui(figure('Name','Answer','NumberTitle','off'),'center');
    handles.result = handles.img;
    for i = 1:3
        handles.result = uint8(filter2(h, handles.img(:,:,i)));
        subplot(2, 2, i);
        imshow(handles.result);
    end
    
    % Y filter
    YUV = rgb2ntsc(handles.img);
    Y = YUV(:,:,1);
    YUV(:,:,1) = filter2(h, Y);
    handles.result = ntsc2rgb(YUV);
    
    % Show the image that have been filter
    subplot(2, 2, 4);
    imshow(handles.result);
    
else
    
    % Send the warning
    warndlg('The image cannot be filtered.','Warning')
    return
end

% Store the variable data as GUI data
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_Filter_cave_Callback(hObject, eventdata, handles)
% Create and open input dialog box
prompt={'Rows (Mask Height):',...
    'Columns (Mask Width):',...
    'shape parameter (1=full, 2=same, 3=valid):'};
name='Customized Filter';
numlines=1;
rowstr = '3';
colstr = '3';
defaultanswer={rowstr, colstr, '2'};
answer = inputdlg(prompt, name, numlines, defaultanswer);
if isempty(answer)
    return
elseif isempty(answer{1}) || isempty(answer{2}) || ~ismember(answer{3},['1','2','3'])
    warndlg('Error inputs.','Warning')
    return
else
    switch answer{3}
        case {'1'}
            meth_str = 'full';
        case {'2'}
            meth_str = 'same';
        case {'3'}
            meth_str = 'valid';
    end
    
    % Create predefined 2-D filter
    h = fspecial('average', [str2num(answer{1}) str2num(answer{2})]);
    
    if (handles.dim)==1 % Grayscale image
        
        % Image 2-D digital filter
        handles.result = uint8(filter2(h, handles.img, meth_str));
        
        % Show image
        set(ipgui,'CurrentAxes',handles.axes2);
        imshow(handles.result);
        
        % Get and show image information
        [rows cols dim] = size(handles.result);
        info_str = cell(7,1);
        info_str{1} = strcat('Image Width:', num2str(cols));
        info_str{2} = strcat('Image Height:', num2str(rows));
        info_str{3} = strcat('Image Dimension:', num2str(dim));
        info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
        info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
        info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
        info_str{7} = strcat('ColorType:', handles.ColorType);
        set(handles.text2,'String', info_str);
        
    elseif (handles.dim) == 3 % RGB
        % Show three image
        movegui(figure('Name','Answer','NumberTitle','off'),'center');
        handles.result = handles.img;
        for i = 1:3
            handles.result = uint8(filter2(h, handles.img(:,:,i)));
            subplot(2, 2, i);
            imshow(handles.result);
        end
        
        % Y filter
        YUV = rgb2ntsc(handles.img);
        Y = YUV(:,:,1);
        YUV(:,:,1) = filter2(h, Y);
        handles.result = ntsc2rgb(YUV);
        
        % Show the image that have been filter
        subplot(2, 2, 4);
        imshow(handles.result);
    else
        warndlg('The image cannot be filtered.','Warning')
        return
    end
    
    
    
    % Store the variable data as GUI data
    guidata(hObject,handles);
end
% --------------------------------------------------------------------
function Menu_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_ROI_point_Callback(hObject, eventdata, handles)
% Set ROI funtion disable
set(handles.Menu_ROI, 'Enable', 'off');

% Draw point
set(ipgui, 'CurrentAxes', handles.axes1);
imshow(handles.img);
impixelinfo;

% Get current Axes
h = impoint(gca);
pos = getPosition(h);
pos = round(pos);
delete(h)
hold on, plot(pos(1), pos(2), 'r*'), hold off

% Get and show image information
info_str = cell(9,1);
info_str{1} = strcat('Image Width:', num2str(handles.cols));
info_str{2} = strcat('Image Height:', num2str(handles.rows));
info_str{3} = strcat('Image Dimension:', num2str(handles.dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.img(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.img(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('Point info:', num2str(pos));
info_str{9} = strcat('Point intensity:', num2str(handles.img(pos(2),pos(1),:)));
set(handles.text2,'String', info_str);

% Set ROI funtion enable
set(handles.Menu_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_ROI_line_Callback(hObject, eventdata, handles)
% Set ROI funtion disable
set(handles.Menu_ROI, 'Enable', 'off');

% Draw point
set(ipgui, 'CurrentAxes', handles.axes1);
imshow(handles.img);
impixelinfo;

% Get current Axes
h = imline(gca);
pos = getPosition(h);
pos = round(pos);
delete(h)
hold on, line(pos(:,1),pos(:,2),'Color','r'), hold off

% Get and show image information
info_str = cell(9,1);
info_str{1} = strcat('Image Width:', num2str(handles.cols));
info_str{2} = strcat('Image Height:', num2str(handles.rows));
info_str{3} = strcat('Image Dimension:', num2str(handles.dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.img(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.img(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('Point info:', num2str(pos));
info_str{9} = strcat('Point intensity:', num2str(handles.img(pos(2),pos(1),:)));
set(handles.text2,'String', info_str);

% Set ROI funtion enable
set(handles.Menu_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_ROI_rectangle_Callback(hObject, eventdata, handles)
% Set ROI funtion disable
set(handles.Menu_ROI, 'Enable', 'off');

% Draw point
set(ipgui, 'CurrentAxes', handles.axes1);
imshow(handles.img);
impixelinfo;

% Get current Axes
h = imrect(gca);
pos = getPosition(h);
pos = round(pos);
delete(h)
hold on
line([pos(1) pos(1)+pos(3) pos(1)+pos(3) pos(1) pos(1)],...
[pos(2) pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2)],'Color','r');
hold off

% Extract image
handles.result = handles.img(pos(2)+1:pos(2)+pos(4),pos(1)+1:pos(1)+pos(3),:);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image information
info_str = cell(9,1);
info_str{1} = strcat('Image Width:', num2str(handles.cols));
info_str{2} = strcat('Image Height:', num2str(handles.rows));
info_str{3} = strcat('Image Dimension:', num2str(handles.dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.img(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.img(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('Point info:', num2str(pos));
info_str{9} = strcat('Point intensity:', num2str(handles.img(pos(2),pos(1),:)));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);

% Set ROI funtion enable
set(handles.Menu_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_ROI_polygon_Callback(hObject, eventdata, handles)
% Set ROI function disable
set(handles.Menu_ROI,'Enable','off');

% Draw polygon
set(ipgui,'CurrentAxes',handles.axes1);
imshow(handles.img);
impixelinfo;
h = impoly(gca);
pos = getPosition(h);
BW = createMask(h);
pos = round(pos);
delete(h)
hold on
line([pos(:,1);pos(1,1)],[pos(:,2);pos(1,2)],'Color','r');
hold off

xmin = min(pos(:,1));
ymin = min(pos(:,2));
xmax = max(pos(:,1));
ymax = max(pos(:,2));

% Extract image
if (handles.dim) == 1 % Grayscale image
    handles.result = BW(ymin:ymax,xmin:xmax).*double(handles.img(ymin:ymax,xmin:xmax));
elseif (handles.dim) == 3 % RGB color image
    handles.result = zeros(ymax-ymin+1,xmax-xmin+1,3);

    for i=1:3
    handles.result(:,:,i) = BW(ymin:ymax,xmin:xmax).*double(handles.img(ymin:ymax,xmin:xmax,i));
    end
end
handles.result = uint8(handles.result);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('[xmin ymin xmax ymax]:', num2str([xmin ymin xmax ymax]));
set(handles.text2,'String', info_str);
% Store the variable data as GUI data
guidata(hObject,handles);
% Set ROI function enable
set(handles.Menu_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_ROI_ellipse_Callback(hObject, ~, handles)
% Set ROI function disable
set(handles.Menu_ROI,'Enable','off');

% Draw ellipse
set(ipgui,'CurrentAxes',handles.axes1);
imshow(handles.img);
impixelinfo;

h = imellipse(gca);
vert = getVertices(h);
BW = createMask(h);
vert = round(vert);
delete(h)

hold on
line([vert(:,1);vert(1,1)],[vert(:,2);vert(1,2)],'Color','r');
hold off

xmin = min(vert(:,1));
ymin = min(vert(:,2));
xmax = max(vert(:,1));
ymax = max(vert(:,2));
% Extract image
if (handles.dim)==1 %grayscale image
    handles.result = BW(ymin:ymax,xmin:xmax).*double(handles.img(ymin:ymax,xmin:xmax));
    
elseif (handles.dim)==3 %RGB color image
    handles.result = zeros(ymax-ymin+1,xmax-xmin+1,3);
    
    for i=1:3
    handles.result(:,:,i) = BW(ymin:ymax,xmin:xmax).*double(handles.img(ymin:ymax,xmin:xmax,i));
    end
end
handles.result = uint8(handles.result);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('[xmin ymin xmax ymax]:', num2str([xmin ymin xmax ymax]));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);

% Set ROI function enable
set(handles.Menu_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_ROI_freehand_Callback(hObject, ~, handles)
% Set ROI function disable
set(handles.Menu_ROI,'Enable','off');

% Draw yourself
set(ipgui,'CurrentAxes',handles.axes1);
imshow(handles.img);
impixelinfo;

h = imfreehand(gca);
vert = getVertices(h);
BW = createMask(h);
vert = round(vert);
delete(h)

hold on
line([vert(:,1);vert(1,1)],[vert(:,2);vert(1,2)],'Color','r');
hold off

xmin = min(vert(:,1));
ymin = min(vert(:,2));
xmax = max(vert(:,1));
ymax = max(vert(:,2));
% Extract image
if (handles.dim) == 1 % Grayscale image
    handles.result = BW(ymin:ymax,xmin:xmax).*double(handles.img(ymin:ymax,xmin:xmax));
    
elseif (handles.dim) == 3 % RGB color image
    handles.result = zeros(ymax-ymin+1,xmax-xmin+1,3);
    
    for i=1:3
    handles.result(:,:,i) = BW(ymin:ymax,xmin:xmax).*double(handles.img(ymin:ymax,xmin:xmax,i));
    end
end
handles.result = uint8(handles.result);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('[xmin ymin xmax ymax]:', num2str([xmin ymin xmax ymax]));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);

% Set ROI function enable
set(handles.Menu_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_Filter_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Filter_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Filter_ROI_average_Callback(hObject, eventdata, handles)
% Set ROI funtion disable
set(handles.Menu_Filter_ROI,'Enable','off');

% Draw rectangle
set (ipgui, 'CurrentAxes', handles.axes1);
imshow(handles.img)
impixelinfo;
h = imrect(gca);
BW = createMask(h);
pos = getPosition(h);
pos = round(pos);
delete(h)

hold on;
line([pos(1) pos(1)+pos(3) pos(1)+pos(3) pos(1) pos(1)],...
[pos(2) pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2)],'Color','r');
hold off;

% Create predefined 2-D filter
f = fspecial('average',[25,25]); 

% Extract image
handles.result = roifilt2(f, handles.img, BW);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image imformation
[rows, cols, dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('[xmin ymin width height]:', num2str(pos));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);

% Set ROI funtion enable
set(handles.Menu_Filter_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_Filter_ROI_LoG_Callback(hObject, eventdata, handles)
% Set ROI funtion disable
set(handles.Menu_Filter_ROI,'Enable','off');

% Draw rectangle
set (ipgui, 'CurrentAxes', handles.axes1);
imshow(handles.img)
impixelinfo;
h = imrect(gca);
BW = createMask(h);
pos = getPosition(h);
pos = round(pos);
delete(h)

hold on;
line([pos(1) pos(1)+pos(3) pos(1)+pos(3) pos(1) pos(1)],...
[pos(2) pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2)],'Color','r');
hold off;

% Create predefined 2-D filter
f = fspecial('log',[25,25]); 

% Extract image
handles.result = roifilt2(f, handles.img, BW);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image imformation
[rows, cols, dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('[xmin ymin width height]:', num2str(pos));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);

% Set ROI funtion enable
set(handles.Menu_Filter_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_Filter_ROI_unsharp_Callback(hObject, eventdata, handles)
% Set ROI funtion disable
set(handles.Menu_Filter_ROI,'Enable','off');

% Draw rectangle
set (ipgui, 'CurrentAxes', handles.axes1);
imshow(handles.img)
impixelinfo;
h = imrect(gca);
BW = createMask(h);
pos = getPosition(h);
pos = round(pos);
delete(h)

hold on;
line([pos(1) pos(1)+pos(3) pos(1)+pos(3) pos(1) pos(1)],...
[pos(2) pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2)],'Color','r');
hold off;

% Create predefined 2-D filter
f = fspecial('unsharp'); 

% Extract image
handles.result = roifilt2(f, handles.img, BW);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image imformation
[rows, cols, dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('[xmin ymin width height]:', num2str(pos));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);

% Set ROI funtion enable
set(handles.Menu_Filter_ROI,'Enable','on');


% --------------------------------------------------------------------
function Menu_Filter_ROI_mosaic_Callback(hObject, eventdata, handles)
% Set ROI funtion disable
set(handles.Menu_Filter_ROI,'Enable','off');

% Draw rectangle
set (ipgui, 'CurrentAxes', handles.axes1);
imshow(handles.img)
impixelinfo;
h = imrect(gca);
BW = createMask(h);
pos = getPosition(h);
pos = round(pos);
delete(h)

pix_grp = 50;
hold on;
roimg = handles.img(pos(2)+1:pos(2)+pos(4),pos(1)+1:pos(1)+pos(3),:);
hold off;
mosaic = imresize(roimg,[floor(pos(4)/pix_grp) floor(pos(3)/pix_grp)]);
mosaic = imresize(mosaic,[pos(4) pos(3)],'nearest');
handles.result = handles.img;
handles.result(pos(2)+1:pos(2)+pos(4),pos(1)+1:pos(1)+pos(3),:) = mosaic;

% Create predefined 2-D filter
% f = fspecial('average',[25,25]); 

% Extract image
% handles.result = roifilt2(f, handles.img, BW);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image imformation
[rows, cols, dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', handles.ColorType);
info_str{8} = strcat('[xmin ymin width height]:', num2str(pos));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);

% Set ROI funtion enable
set(handles.Menu_Filter_ROI,'Enable','on');% hObject    handle to Menu_Filter_ROI_mosaic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Thre_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Thre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Thre_otsu_Callback(hObject, eventdata, handles)
if (handles.dim)==1 && (handles.bitdepth)==8 % Grayscale image
    % Global image threshold using Otsu's method
    level = graythresh(handles.img);
    handles.result = imbinarize(handles.img,level);
elseif (handles.dim) == 3 && (handles.bitdepth) == 24 % RGB color image
    level_R = graythresh(handles.img(:, :, 1));
    level_G = graythresh(handles.img(:, :, 2));
    level_B = graythresh(handles.img(:, :, 3));
    
    imR = imbinarize(handles.img(:, :, 1), level_R);
    imG = imbinarize(handles.img(:, :, 2), level_G);
    imB = imbinarize(handles.img(:, :, 3), level_B);
    
    handles.result = imR | imG | imB;
else
    warndlg('The image cannot be processed.','Warning')
    return
end

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image information
[rows cols dim] = size(handles.result);
info_str = cell(8,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
if (handles.dim)==1 %grayscale image
info_str{8} = strcat('Otsu threshold level:', num2str(level));
elseif (handles.dim)==3 %RGB color image
info_str{8} = strcat('Otsu threshold level:', num2str([level_R,level_G,level_B]));
end
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);


% --------------------------------------------------------------------
function Menu_Thre_user_Callback(hObject, eventdata, handles)
if (handles.dim)==1 && (handles.bitdepth)==8 % Grayscale image
    % Global image threshold using Otsu's method
    level = graythresh(handles.img);
elseif (handles.dim)==3 && (handles.bitdepth)==24 % RGB color image
    % Color image threshold using Otsu's method
    level = graythresh(rgb2gray(handles.img));
else
    warndlg('The image cannot be processed.','Warning')
    return
end

% Convert image to binary image, based on threshold
handles.result = imbinarize(handles.img,level);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Enable functions
set(handles.slider1,'Enable','on');
set(handles.slider1,'Max',1);
set(handles.slider1,'Min',0);
set(handles.slider1,'Value',level);

% Get and show image information
[rows cols dim] = size(handles.result);
info_str = cell(9,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
info_str{8} = strcat('Threshold level:', num2str(level));
info_str{9} = strcat('Threshold grayscale:', num2str(round(level*255)));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
if (handles.dim)==1 && (handles.bitdepth)==8 % Grayscale image
    % Global image threshold using slider's value
    slider_value = get(hObject,'Value');
    handles.result = imbinarize(handles.img,slider_value);
elseif (handles.dim)==3 && (handles.bitdepth)==24 %RGB color image
    % Color image threshold using Otsu's method
    slider_value = get(hObject,'Value');
    handles.result = imbinarize(rgb2gray(handles.img),slider_value);
else
    warndlg('The input image is already binary.','Warning')
    return
end

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Get and show image information
[rows cols dim] = size(handles.result);
info_str = cell(9,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
info_str{8} = strcat('Threshold level:', num2str(slider_value));
info_str{9} = strcat('Threshold grayscale:', num2str(round(slider_value*255)));
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function Menu_Edge_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Edge_prewitt_Callback(hObject, ~, handles)
if(handles.dim) == 1   % Grayscale image
    % Find edges in grayscale image
    handles.result = edge(handles.img, 'prewitt');
elseif(handles.dim) == 3 % RGB image
    % Find edges with 3 dim
    R_edge = edge(handles.img(:, :, 1), 'prewitt');
    G_edge = edge(handles.img(:, :, 2), 'prewitt');
    B_edge = edge(handles.img(:, :, 3), 'prewitt');
    
    handles.result = R_edge | G_edge | B_edge;
else
    warndlg('The image cannot be processed.', 'Warning')
    return
end

% Show image
set(ipgui, 'CurrentAxes', handles.axes2);
imshow(handles.result, []);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject, handles);


% --------------------------------------------------------------------
function Menu_Edge_sobel_Callback(hObject, eventdata, handles)
if(handles.dim) == 1   % Grayscale image
    % Find edges in grayscale image
    handles.result = edge(handles.img, 'sobel');
elseif(handles.dim) == 3 % RGB image
    % Find edges with 3 dim
    R_edge = edge(handles.img(:, :, 1), 'sobel');
    G_edge = edge(handles.img(:, :, 2), 'sobel');
    B_edge = edge(handles.img(:, :, 3), 'sobel');
    
    handles.result = R_edge | G_edge | B_edge;
else
    warndlg('The image cannot be processed.', 'Warning')
    return
end

% Show image
set(ipgui, 'CurrentAxes', handles.axes2);
imshow(handles.result, []);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject, handles);


% --------------------------------------------------------------------
function Menu_Edge_LoG_Callback(hObject, eventdata, handles)
if(handles.dim) == 1   % Grayscale image
    % Find edges in grayscale image
    handles.result = edge(handles.img, 'LoG');
elseif(handles.dim) == 3 % RGB image
    % Find edges with 3 dim
    R_edge = edge(handles.img(:, :, 1), 'LoG');
    G_edge = edge(handles.img(:, :, 2), 'LoG');
    B_edge = edge(handles.img(:, :, 3), 'LoG');
    
    handles.result = R_edge | G_edge | B_edge;
else
    warndlg('The image cannot be processed.', 'Warning')
    return
end

% Show image
set(ipgui, 'CurrentAxes', handles.axes2);
imshow(handles.result, []);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject, handles);


% --------------------------------------------------------------------
function Menu_Edge_zerocross_Callback(hObject, eventdata, handles)
if(handles.dim) == 1   % Grayscale image
    % Find edges in grayscale image
    handles.result = edge(handles.img, 'zerocross');
elseif(handles.dim) == 3 % RGB image
    % Find edges with 3 dim
    R_edge = edge(handles.img(:, :, 1), 'zerocross');
    G_edge = edge(handles.img(:, :, 2), 'zerocross');
    B_edge = edge(handles.img(:, :, 3), 'zerocross');
    
    handles.result = R_edge | G_edge | B_edge;
else
    warndlg('The image cannot be processed.', 'Warning')
    return
end

% Show image
set(ipgui, 'CurrentAxes', handles.axes2);
imshow(handles.result, []);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject, handles);


% --------------------------------------------------------------------
function Menu_Edge_canny_Callback(hObject, eventdata, handles)
if(handles.dim) == 1   % Grayscale image
    % Find edges in grayscale image
    handles.result = edge(handles.img, 'canny');
elseif(handles.dim) == 3 % RGB image
    % Find edges with 3 dim
    R_edge = edge(handles.img(:, :, 1), 'canny');
    G_edge = edge(handles.img(:, :, 2), 'canny');
    B_edge = edge(handles.img(:, :, 3), 'canny');
    
    handles.result = R_edge | G_edge | B_edge;
else
    warndlg('The image cannot be processed.', 'Warning')
    return
end

% Show image
set(ipgui, 'CurrentAxes', handles.axes2);
imshow(handles.result, []);

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
set(handles.text2,'String', info_str);

% Store the variable data as GUI data
guidata(hObject, handles);


% --------------------------------------------------------------------
function Menu_Edge_hough_Callback(hObject, ~, handles)
if(handles.dim) == 1 % Grayscale image
    % Find edges in grayscale image
    handles.result = edge(handles.img, 'canny');
elseif(handles.dim) == 3 % RGB image
    % Find edges in RGB color image
    handles.result = edge(handles.img(:,:,1), 'canny')...
    | edge(handles.img(:,:,2), 'canny')...
    | edge(handles.img(:,:,3), 'canny');
else
    warndlg('The image cannot be processed.', 'Warning')
    return
end

% Hough transform
[H,T,R] = hough(handles.result);
P = houghpeaks(H,3);   % Set max 3 lines
lines = houghlines(handles.result,T,R,P);

% Show image
set(ipgui, 'CurrentAxes', handles.axes2);
imshow(handles.result, []);

% Show lines
hold on;
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','r');
end
hold off;

% Get and show image information
[rows, cols, dim] = size(handles.result);
info_str = cell(7,1);
info_str{1} = strcat('Image Width:', num2str(cols));
info_str{2} = strcat('Image Height:', num2str(rows));
info_str{3} = strcat('Image Dimension:', num2str(dim));
info_str{4} = strcat('Bits Per Pixel:', '1');
info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
info_str{7} = strcat('ColorType:', 'binary');
set(handles.text2,'String', info_str);

% Store the cariable data as GUI data
guidata(hObject, handles);


% --------------------------------------------------------------------
function Menu_Conv_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Conv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Conv_rgb2gray_Callback(hObject, eventdata, handles)
if(handles.dim) == 3
    % Convert RGB to gray image
    handles.result = rgb2gray(handles.img);
    
    % Show image
    set(ipgui, 'CurrentAxes', handles.axes2);
    imshow(handles.result)
    
    % Get and show image information
    [rows cols dim] = size(handles.result);
    info_str = cell(7,1);
    info_str{1} = strcat('Image Width:', num2str(cols));
    info_str{2} = strcat('Image Height:', num2str(rows));
    info_str{3} = strcat('Image Dimension:', num2str(dim));
    info_str{4} = strcat('Bits Per Pixel:', '8');
    info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
    info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
    info_str{7} = strcat('ColorType:', 'grayscale');
    set(handles.text2,'String', info_str);
    
    % Store the variable data as GUI data
    guidata(hObject, handles);
else
    warndlg('The image is not RGB format.', 'Warning')
    return
end


% --------------------------------------------------------------------
function Menu_Conv_resize_Callback(hObject, eventdata, handles)
% Create and open input dialog box
prompt = {'Rows(Image Height):', 'Columns(Image Width):', 'Interpolation Method(1 = nearest, 2 = billinear, 3 = bicubic):'};
name = 'Image Resizing';
numlines = 1;
rowstr = num2str(handles.rows);
colstr = num2str(handles.cols);
defaultanswer = {rowstr, colstr, '1'};

answer = inputdlg(prompt, name, numlines, defaultanswer);

if isempty(answer)
    return
else
    switch answer{3}
        case {'1'}
            meth_str = 'nearest';
        case{'2'}
            meth_str = 'bilinear';
        case{'3'}
            meth_str = 'bicubic';
    end
    
    % Resize image
    handles.result = imresize(handles.img, [str2num(answer{1}) str2num(answer{2})], meth_str);
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2)
    imshow(handles.result);
    
    % Get and show image information
    [rows cols dim] = size(handles.result);
    info_str = cell(7,1);
    info_str{1} = strcat('Image Width:', num2str(cols));
    info_str{2} = strcat('Image Height:', num2str(rows));
    info_str{3} = strcat('Image Dimension:', num2str(dim));
    info_str{4} = strcat('Bits Per Pixel:', num2str(handles.bitdepth));
    info_str{5} = strcat('Max. Value:', num2str(max(handles.result(:))));
    info_str{6} = strcat('Min. Value:', num2str(min(handles.result(:))));
    info_str{7} = strcat('ColorType:', handles.ColorType);
    set(handles.text2,'String', info_str);
    
    % Store the variable data as GUI data
    guidata(hObject, handles);
end


% --------------------------------------------------------------------
function Menu_Conv_split2rgb_Callback(hObject, eventdata, handles)
if (handles.dim) == 3
    nameList = ["_R", "_G", "_B"];
    % Write and Show image
    for i = 1:3
        SI = figure;
        figure(SI);
        iptsetpref('ImshowBorder','tight')   % remove figure border
        imshow(handles.img(:,:,i));
        name = strsplit(handles.FileName, '.');
        fileName = strcat(name{1}, nameList{i});
        imwrite(handles.img(:,:,i), [handles.PathName, fileName, '.tif'])
    end
else
    warndlg('The image is not RGB format.', 'Warning')
    return
end


% --------------------------------------------------------------------
function Menu_Conv_rotate_Callback(hObject, eventdata, handles)
% Create and open input dialog box
prompt = {'Rotate angle(Image degree):', 'Interpolation Method (1 = nearest, 2 = bilinear, 3 = bicubic):'};
name = 'Image rotate';
numlines = 1;
defaultanswer = {'90', '1'};

answer = inputdlg(prompt, name, numlines, defaultanswer);
if isempty(answer)
    return
else
    switch answer{2}
        case{'1'}
            meth_str = 'nearest';
        case {'2'}
            meth_str = 'bilinear';
        case {'3'}
            meth_str = 'bicubic';
    end
    
    % Rotate image
    handles.result = imrotate(handles.img, str2num(answer{1}), meth_str);
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2)
    imshow(handles.result);
end


% --------------------------------------------------------------------
function Menu_Filter_Fourier_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Filter_Fourier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Filter_Fourier_lowpass_Callback(hObject, eventdata, handles)
if mod(handles.rows, 2) == 0
    h = handles.rows/2;
    hr = -h:h-1;
else
    h = floor(handles.rows/2);
    hr = -h:h;
end

if mod(handles.cols, 2) == 0
    w = handles.cols/2;
    wr = -w:w-1;
else
    w = floor(handles.cols2);
    wr = -w:w;
end

% Create and open input dialog box
% prompt = {'Image Radius:'};
% name = 'Image rotate';
% numlines = 1;
% defaultanswer = {'90', '1'};
% 
% answer = inputdlg(prompt, name, numlines, defaultanswer);

% Create a small circle mask
[x, y] = meshgrid(wr, hr);
z = sqrt(x.^2 + y.^2);
c = (z < 15);

% Fourier lowpass filter
handles.result = ifft2( ifftshift( fftshift( fft2(handles.img) ).*c ) );
handles.result(find(handles.result<0) ) = 0;
handles.result(find(handles.result>255) ) = 255;
handles.result = uint8(handles.result);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Store the variable data as GUI data
guidata(hObject, handles);


% --------------------------------------------------------------------
function Menu_Filter_Fourier_highpass_Callback(hObject, eventdata, handles)
if mod(handles.rows, 2) == 0
    h = handles.rows/2;
    hr = -h:h-1;
else
    h = floor(handles.rows/2);
    hr = -h:h;
end

if mod(handles.cols, 2) == 0
    w = handles.cols/2;
    wr = -w:w-1;
else
    w = floor(handles.cols2);
    wr = -w:w;
end

% Create a small circle mask
[x, y] = meshgrid(wr, hr);
z = sqrt(x.^2 + y.^2);
c = (z > 15);

% Fourier lowpass filter
handles.result = ifft2( ifftshift( fftshift( fft2(handles.img) ).*c ) );
handles.result(find(handles.result<0) ) = 0;
handles.result(find(handles.result>255) ) = 255;
handles.result = uint8(handles.result);

% Show image
set(ipgui,'CurrentAxes',handles.axes2);
imshow(handles.result,[]);

% Store the variable data as GUI data
guidata(hObject, handles);



function edit8_Callback(hObject, eventdata, handles)
[rows cols dim] = size(handles.ana);
edit_value = str2num(get(hObject,'String'));

if edit_value < 1
    edit_value = 1;
elseif edit_value > dim
    edit_value = dim;
end

set(handles.edit8,'String',num2str(edit_value));
set(handles.slider8,'Value',edit_value);
handles.img = handles.ana(:,:,edit_value);

% Show image
set(ipgui,'CurrentAxes',handles.axes1);
imshow(handles.img);
% Store the variable data as GUI data
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
[rows cols dim] = size(handles.ana);
slider_value = round(get(hObject,'Value'));
set(handles.edit8,'String',num2str(slider_value));
handles.img = handles.ana(:,:,slider_value);

% Show image
set(ipgui,'CurrentAxes',handles.axes1);
imshow(handles.img);

% Store the variable data as GUI data
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function Menu_ROI_snake_Callback(hObject, eventdata, handles)
if size(handles.img, 3) == 1 % Grayscale image
    set(ipgui,'CurrentAxes',handles.axes1);
    imshow(handles.img,[]);
    
    % Snake initialization
    cd snake
    [x,y] = snakeinit(1);
    [x,y] = snakeinterp(x,y,3,1);
    snakedisp(x,y,'r');
    
    % Compute its edge map
    [gx,gy] = gradient(double(handles.img));
    magG = sqrt(gx.*gx+gy.*gy);
    
    % Compute GVF of edge map
    [u,v] = GVF(magG, 0.2, 80);
    mag = sqrt(u.*u+v.*v);
    px = u./(mag+1e-10); py = v./(mag+1e-10);
    % Snake deformation
    for i=1:20
        [x,y] = snakedeform(x,y,0.05,0,1,0.6,px,py,5);
        [x,y] = snakeinterp(x,y,3,1);
        if (rem(i,2) == 0)
            snakedisp(x,y,'r');
            pause(0.5);
        end
    end
    cd ..
    
    % Show image
    set(ipgui,'CurrentAxes',handles.axes2);
    imshow(handles.img,[]);
    hold on;
    plot(x,y,'r');
    hold off;
    % Store the variable data as GUI data
    guidata(hObject,handles);
else
    warndlg('The image cannot be processed.','Warning')
    return
end


% --------------------------------------------------------------------
function Menu_Object_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Object (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Object_Segment_Callback(hObject, eventdata, handles)
if isfield(handles, 'ana') ==0
    warndlg('None input data.', 'Warning');
else
    [rows cols dim] = size (handles.ana);
    
    % Create and open input dialog box
    prompt = {'Slice low:', 'Slice high:'};
    name = 'Range selection';
    numlines = 1;
    defaultanswer = {'1', num2str(dim)};
    answer = inputdlg(prompt, name, numlines, defaultanswer);
    s_low = str2num(answer{1});
    s_high = str2num(answer{2});
    
    if isempty(answer)
        return
    else
        count = 1;
        for i = s_low:s_high
            handles.img = handles.ana(:,:,i);
            set(ipgui,'CurrentAxes',handles.axes1);
            imshow(uint8(handles.img));
            set(handles.slider8,'Value',i);
            set(handles.edit8,'String',i);
            impixelinfo;
            handles.result = zeros(size(handles.img));
            button = 'Yes';
            
            while find(button == 'Y')
                % Draw polygon
                set(ipgui,'CurrentAxes',handles.axes1);
                h = impoly(gca);
                pos = getPosition(h);
                BW = createMask(h);
                pos = round(pos);
                delete(h);
                hold on
                line([pos(:,1);pos(1,1)],[pos(:,2);pos(1,2)],'Color','r');
                hold off
                
                % Create mask
                handles.result = handles.result | BW;
                
                % Show image
                set(ipgui,'CurrentAxes',handles.axes2);
                imshow(handles.result, []);
                button = questdlg('Continue Segmentation?');
            end
            handles.result = uint8(handles.result.*double(handles.img));
            set(ipgui,'CurrentAxes',handles.axes2);
            imshow(handles.result);
            handles.seg(:,:,count) = handles.result;
            count = count +1;
        end
        % Stroe the variable data as GUI data
        guidata(hObject, handles);
    end
end


% --------------------------------------------------------------------
function Menu_Object_Contour_Callback(hObject, eventdata, handles)
if isfield(handles,'ana')==0
    warndlg('None input data.','Warning');
    return
else
    [rows cols dim] = size(handles.ana);
    
    % Create and open input dialog box
    prompt={'Slice low:', 'Slice high:'};
    name='Range selection';
    numlines=1;
    
    % Defaultanswer={'1', num2str(dim)};
    defaultanswer={'21', '154'};
    answer = inputdlg(prompt, name, numlines, defaultanswer);
    if isempty(answer)
        return
    else
        figure; h1=gcf; figure; h2=gcf;
        for i=str2num(answer{1}):str2num(answer{2})
            figure(h1);
            [C,handle] = imcontour(handles.ana(:,:,i),1);
            idx = 1;
            figure(h2);
            hold on;
            while idx < length(C)
                plot3(C(1,idx+1:idx+C(2,idx)),C(2,idx+1:idx+C(2,idx)),...
                    i*ones(1,C(2,idx)),...
                    'color',[0, 1, 0]);
                idx = idx+C(2,idx)+1;
            end
            hold off;
        end
        close(figure(h1));
        view(3); axis tight; axis equal; axis off;
    end
end


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
if isfield(handles,'ana')==0
    warndlg('None input data.','Warning');
    return
else
    [rows cols dim] = size(handles.ana);
    level = graythresh(handles.ana(:,:,round(dim/2)));
    level = round(level*255);
    %Create and open input dialog box
    prompt={'Slice low:',...
        'Slice high:',...
        'Threshold:',...
        'FaceColor in isocaps (1=interp,2=none):'};
    name='Range selection';
    numlines=1;
    defaultanswer={'1', num2str(dim), num2str(level), '1'};
    answer = inputdlg(prompt, name, numlines, defaultanswer);
    if isempty(answer)
        return
    else
        switch answer{4}
            case {'1'}
                meth_str = 'interp';
            case {'2'}
                meth_str = 'none';
        end
        figure;
        [x,y,z,D] = subvolume(handles.ana,...
            [nan,nan,nan,nan,str2num(answer{1}),str2num(answer{2})]);
        p1 = patch(isosurface(D, str2num(answer{3})),...
            'FaceColor',[0, 1, 0], 'EdgeColor','none');
        p2 = patch(isocaps(D, str2num(answer{3})),'FaceColor', meth_str,...
            'EdgeColor','none');
        isonormals(x,y,z,D,p1);
        view(3); axis tight; axis equal; box on;
        colormap(gray(256));
        camlight left; camlight; lighting gouraud;
    end
end
