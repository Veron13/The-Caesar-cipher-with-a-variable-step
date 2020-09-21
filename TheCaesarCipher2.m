function TheCaesarCipher2

figure('MenuBar','None', ... % - �������� ������������ ���� ��� �������� � ������(��� ���� ��, ���� ��� ������ figure())
'Name','TheCaesarCipher2', ...          % - �������� �������� �� ����
'NumberTitle','off', ...         % - ������� �������� ����� ����� !!!
'Position', [400, 250, 570, 400])  % - ����� ������� ������� ����������� ����, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������������ ����  

uicontrol('Style','Text', ... % - ������ ������ ����� - �������� ������������ ������, ����������� � ����� ����������� �������� Text
   'String', '���� ������ � ���������� �����', ...             % - ����� �������, � ������ "���� ������ � ���������� �����"   
  'Position', [40, 200, 480, 200], ...  % - ����� ������� ������, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������
  'Fontsize',23)  % - ����� ������ ������ ������

clc                             % - �������� ������� ������ ���������� ���� :)
clear all                      % - �������� ������� ������ ���������� ���� :)

uicontrol('Style','PushButton', ... % - ������ ������ ������, ����������� � ����� ����������� �������� PushButton
   'String', '����������� ���������� �����', ...             % - ����� ������� �� ���  "����������� ���������� �����" 
  'Position', [20, 260, 180, 30], ...  % - ����� ������� ������, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������    
  'CallBack',@theloadtext)   % - ����� �������  CallBack � � �������� � ������� ������ �� ������ ������� theloadtext

%%%%%%%%%%%%%%%%%%%%
 function theloadtext(h,eventdata) % - ���������� ��� ��������� ����
       load text Words; % - ��������� ����� �� ������ m-�����
  set(Text,'String',Words); % - ��������� ����� � ���� ��� ������ � ���
 end
%%%%%%%%%%%%%%%%%%%%

Important = uicontrol('Style','edit', ... % - ������ ���� ��� ����� �����, ����������� �� ������ � ����������� ��������  EditText
   'String', '', ...             % - ����� �� �� ����������� �������    
  'Position', [270, 90, 100, 30])  % - ����� ������� ����, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������� 

uicontrol('Style','Text', ... % - ������ ������� ��� �����, ����������� �� ������ � ����������� ��������  Text
   'String', '������� ����:', ...      % - ����� ���� �������   
  'Position', [170, 85, 100, 30], ...  % - ����� ������� ����, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������
  'Fontsize',10)  % - ����� ������ ������ ������
  
Toggle1 = uicontrol('Style','ToggleButton', ... % - ������ ������ � ��������� ��� ����, ����������� �� ������ � ����������� �������� ToggleButton
   'String', '��������� ���������� �����', ...             % - ����� ������� �� ��� ��� ��������  "��������� ���������� �����" 
  'Position', [25, 150, 170, 30], ...  % - ����� ������� ������, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������    
  'CallBack',@Togglewow1)   % - ����� �������  CallBack � � �������� � ������� Togglewow1

Text = uicontrol('Style','edit', ... % - ������ ���� ��� ������ � �������, ����������� �� ������ �  ����������� �������� EditText
   'String', '', ...             % - ����� ���� ������� ""   
  'Position', [200, 150, 170, 140]) ...  % - ����� ������� ������, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������  
  
%%%%%%%%%
   function Togglewow1(h,eventdata) % - ������ ������� ��� ��������� ������ ������
       load text Words; % - ��������� ����� �� ������ m-�����
       load ourtext Words228;
        if get (Toggle1,'Value') == 0  % - ���� �� �������� �� ������ ��� ��������� ������ ������, 
        set(Text,'String',Words228)          %  - ���������� �������� �����
         set(Toggle1,'String','��������� ���������� �����') % - ������ ������� ������� �� ������ ��� ������� �������
        else
            Words228 = get(Text,'String');
             save ourtext Words228;     % - ���������� ��� ����� ��� ��� ��������
            Words = get(Text,'String'); % - ���������� ����� � ��������� ���� ��� ���������
          
            %%%%%%%%%% - ������ ����� ������� �� ������� � ������� �����
Alphabet = ' �����������娸����������������������������������������������������AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!?.,()-';
Len = length(Alphabet)
Alphabet2 = '';
num = get(Important,'String');    % - �������� ������� ����� ��� ���������
        if length(num) == 0
            msgbox('������� ����!!!','����','Modal')   % - � ������ ���������� ����� ���� ��������� �������� �� ����� � �� ���� �������
   
        else        
Key = get(Important,'String'); % ����
        end
Leng = length(Key)
for k=1:1:Leng
   KEY(k)  = findstr(Alphabet,Key(k));
end
disp(KEY)

KEYS = KEY

for alpha=1:1:Leng
for i=1:1:Len
    if  KEYS(alpha)+i > Len
   Alphabet2(alpha,i) = Alphabet(i+KEYS(alpha)-Len);
    else
        Alphabet2(alpha,i) = Alphabet(i+KEYS(alpha));
    end
end
end
disp(Alphabet2)

%%%%%%% ���������
Len2 = length(Words)

alpha2 = 1;
for i2=1:1:Len2 
    for j = 1:1:Len
    if Words(i2) == Alphabet(j)
        Words(i2) =  Alphabet2(alpha2,j);
        alpha2 = alpha2 + 1;
           if alpha2 == Leng+1
       alpha2 = 1;
   end
        break
    end
        end
end           


%%%%%%%%%%%%%%%%%%%%%%%%%%%
            set(Text,'String',Words) % - ��� �����
              team = get(Text,'String');
            set(Toggle1,'String','���������� �������� �����') % - ������ ������� ������� �� ������ ��� ������� �������
            save strangetext team;
        end
   end
%%%%%%%%%%%

Toggle2 = uicontrol('Style','ToggleButton', ... % - ������ � ��������� ��� ����, ����������� �� ������ � ����������� �������� ToggleButton
   'String', '����������� ���������� �����', ...             % - ����� ������� �� �� ���� ������� Toggle   
  'Position', [373, 260, 170, 30], ...  % - ����� ������� ������, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������    
  'CallBack',@Togglewow2)   % - ����� �������  CallBack � � �������� � ������� Togglewow2

%%%%%%%%%
   function Togglewow2(h,~)
        if get (Toggle1,'Value') == 1 % - ������� ���, ����� ����������� ������ ���� ������ � ��� ������, ���� ����� ��� ��� ����������
        if get (Toggle2,'Value') == 0  % - ���� �� �������� �� ������ ��� ����������� ������ ������,
             load strangetext team;
        set(Text,'String',team) %  - ���������� �������� ������������� �����
        set(Toggle2,'String','����������� ���������� �����') % - ������ ������� ������� �� ������ ��� ������� �������
        else
            
            
            %%%%%%%%%%%%%%%%%
             %%%%%%%%%% - ������ ����� ������� �� ������� � ������� �����
            Alphabet = ' �����������娸����������������������������������������������������AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!?.,()-';
Len = length(Alphabet)
Alphabet2 = '';
num = get(Important,'String');    % - �������� ������� ����� ��� �����������
        if length(num) == 0
            msgbox('������� ����!!!','����','Modal')   % - � ������ ���������� ����� ���� ��������� �������� �� ����� � �� ���� �������
   
        else        
Key = get(Important,'String'); % ����
        end
Leng = length(Key)
for k=1:1:Leng
   KEY(k)  = findstr(Alphabet,Key(k));
end
disp(KEY)

KEYS = KEY

for alpha=1:1:Leng
for i=1:1:Len
    if  KEYS(alpha)+i > Len
   Alphabet2(alpha,i) = Alphabet(i+KEYS(alpha)-Len);
    else
        Alphabet2(alpha,i) = Alphabet(i+KEYS(alpha));
    end
end
end

%%%%%%%%%%%%%%%%% ����� ���������� ��� �����
Words = get(Text,'String');
Len2 = length(Words)
alpha2 = 1;
for i3=1:1:Len2 
    for j = 1:1:Len
    if Words(i3) == Alphabet2(alpha2,j)
        Words(i3) =  Alphabet(j);
        alpha2 = alpha2 + 1;
           if alpha2 == Leng+1
       alpha2 = 1;
   end
        break
    end
        end
end


            %%%%%%%%%%%%%%%%%%
            set(Text,'String',Words) % - ���� �������� �����
             set(Toggle2,'String','���������� ������������� �����') % - ������ ������� ������� �� ������ ��� ������� �������
        end
        end
   end
%%%%%%%%%%%

uicontrol('Style','PushButton', ... % - ������ ������ ������, ����������� �� ������ � ����������� �������� PushButton
   'String', '���������� ���������� �����', ...             % - ����� �� ��� ���� ������� "���������� ���������� �����"
  'Position', [373, 150, 180, 30], ...  % - ����� ������� ������, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������    
  'CallBack',@thesavetext)   % - ����� ������� CallBack � � �������� � ������� ������ �� ������� the savetext
%%%%%%%%%%%%%%%%%%%%
 function thesavetext(h,eventdata) % - ��������� ��� ��������� ����
     Words = get(Text,'String');   % - ����������� �������� ������ ������ �����, � ������ ����� � ������� Text
        save text2 Words; % - ��������� ����� �� � ����� m-�����
 end
%%%%%%%%%%%%%%%%%%%%

uicontrol('Style','PushButton', ... % - ������ ������ ������, ����������� � ����� ����������� �������� PushButton
   'String', '������� ���������', ...             % - ����� ������� �� �� ���� ������� �������   
  'Position', [230, 30, 115, 30], ...  % - ����� ������� ������, ��� ������ ��� ����� - ��� ����������, � ����� ������ � ������ ������    
  'CallBack','close')   % - ����� �������  CallBack � � �������� close - �������� ������������ ����

   
end