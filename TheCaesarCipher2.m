function TheCaesarCipher2

figure('MenuBar','None', ... % - создание графического окна без картинки и кнопок(они были бы, если был просто figure())
'Name','TheCaesarCipher2', ...          % - измен€ем название на наше
'NumberTitle','off', ...         % - убираем название перед нашим !!!
'Position', [400, 250, 570, 400])  % - «адаЄм позицию данного графичского окна, где первые два числа - это координаты, а далее ширина и высота графического окна  

uicontrol('Style','Text', ... % - создаЄм просто текст - название лабораторной работы, присваиваем еЄ —тилю определЄнное свойство Text
   'String', 'Ўифр ÷езар€ с переменным шагом', ...             % - «адаЄм надпись, а именно "Ўифр ÷езар€ с переменным шагом"   
  'Position', [40, 200, 480, 200], ...  % - «адаЄм позицию текста, где первые два числа - это координаты, а далее ширина и высота текста
  'Fontsize',23)  % - задаЄм размер нашего текста

clc                             % - работает обычна€ очиста командного окна :)
clear all                      % - работает обычна€ очиста командного окна :)

uicontrol('Style','PushButton', ... % - создаЄм просто кнопку, присваиваем еЄ —тилю определЄнное свойство PushButton
   'String', 'ѕодключение текстового файла', ...             % - «адаЄм надпись на ней  "ѕодключение текстового файла" 
  'Position', [20, 260, 180, 30], ...  % - «адаЄм позицию кнопки, где первые два числа - это координаты, а далее ширина и высота кнопки    
  'CallBack',@theloadtext)   % - «адаЄм функцию  CallBack и еЄ действие с помощью ссылки на другую функцию theloadtext

%%%%%%%%%%%%%%%%%%%%
 function theloadtext(h,eventdata) % - подключаем наш текстовый файл
       load text Words; % - загружаем текст из нашего m-файла
  set(Text,'String',Words); % - загружаем текст в окно дл€ работы с ним
 end
%%%%%%%%%%%%%%%%%%%%

Important = uicontrol('Style','edit', ... % - создаЄм окно дл€ ввода ключа, присваиваем ей объект и определЄнное свойство  EditText
   'String', '', ...             % - «адаЄм на нЄм изначальную надпись    
  'Position', [270, 90, 100, 30])  % - «адаЄм позицию окна, где первые два числа - это координаты, а далее ширина и высота надписи 

uicontrol('Style','Text', ... % - создаЄм надпись дл€ ключа, присваиваем ей объект и определЄнное свойство  Text
   'String', '¬ведите ключ:', ...      % - «адаЄм нашу надпись   
  'Position', [170, 85, 100, 30], ...  % - «адаЄм позицию окна, где первые два числа - это координаты, а далее ширина и высота кнопки
  'Fontsize',10)  % - задаЄм размер нашего текста
  
Toggle1 = uicontrol('Style','ToggleButton', ... % - создаЄм кнопку с задержкой дл€ вида, присваиваем ей объект и определЄнное свойство ToggleButton
   'String', ' одировка текстового файла', ...             % - «адаЄм надпись на ней своЄ название  " одировка текстового файла" 
  'Position', [25, 150, 170, 30], ...  % - «адаЄм позицию кнопки, где первые два числа - это координаты, а далее ширина и высота кнопки    
  'CallBack',@Togglewow1)   % - «адаЄм функцию  CallBack и еЄ действие в функции Togglewow1

Text = uicontrol('Style','edit', ... % - создаЄм окно дл€ работы с текстом, присваиваем ей объект и  определЄнное свойство EditText
   'String', '', ...             % - «адаЄм свою надпись ""   
  'Position', [200, 150, 170, 140]) ...  % - «адаЄм позицию кнопки, где первые два числа - это координаты, а далее ширина и высота кнопки  
  
%%%%%%%%%
   function Togglewow1(h,eventdata) % - создаЄм функцию дл€ кодировки нашего текста
       load text Words; % - загружаем текст из нашего m-файла
       load ourtext Words228;
        if get (Toggle1,'Value') == 0  % - если мы нажимаем на кнопку дл€ кодировки нашего текста, 
        set(Text,'String',Words228)          %  - возвращаем исходный текст
         set(Toggle1,'String',' одировка текстового файла') % - просто изменим надпись на кнопке дл€ большей €сности
        else
            Words228 = get(Text,'String');
             save ourtext Words228;     % - запоминаем наш текст дл€ его возврата
            Words = get(Text,'String'); % - запоминаем текст в текстовом окне дл€ кодировки
          
            %%%%%%%%%% - создаЄм новый алфавит из старого с помощью ключа
Alphabet = ' јаЅб¬в√гƒд≈е®Є∆ж«з»и…й кЋлћмЌнќоѕп–р—с“т”у‘ф’х÷ц„чЎшўщЏъџы№ьЁэёюя€AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!?.,()-';
Len = length(Alphabet)
Alphabet2 = '';
num = get(Important,'String');    % - проверим наличие ключа дл€ кодировки
        if length(num) == 0
            msgbox('¬ведите ключ!!!',' люч','Modal')   % - в случае отсутствие ключа наша программа работать не будет и об этом сообщат
   
        else        
Key = get(Important,'String'); % ключ
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

%%%%%%% кодировка
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
            set(Text,'String',Words) % - наш текст
              team = get(Text,'String');
            set(Toggle1,'String','¬озвращаем исходный текст') % - просто изменим надпись на кнопке дл€ большей €сности
            save strangetext team;
        end
   end
%%%%%%%%%%%

Toggle2 = uicontrol('Style','ToggleButton', ... % - создаЄм с задержкой дл€ вида, присваиваем ей объект и определЄнное свойство ToggleButton
   'String', '–асшифровка текстового файла', ...             % - «адаЄм надпись на нЄм свою надпись Toggle   
  'Position', [373, 260, 170, 30], ...  % - «адаЄм позицию кнопки, где первые два числа - это координаты, а далее ширина и высота кнопки    
  'CallBack',@Togglewow2)   % - «адаЄм функцию  CallBack и еЄ действие в функции Togglewow2

%%%%%%%%%
   function Togglewow2(h,~)
        if get (Toggle1,'Value') == 1 % - сделаем так, чтобы –ј—Ў»‘–ќ¬ ј текста была только в том случае, если текст уже был зашифрован
        if get (Toggle2,'Value') == 0  % - если мы нажимаем на кнопку дл€ расшифровки нашего текста,
             load strangetext team;
        set(Text,'String',team) %  - возвращаем исходный зашифрованный текст
        set(Toggle2,'String','–асшифровка текстового файла') % - просто изменим надпись на кнопке дл€ большей €сности
        else
            
            
            %%%%%%%%%%%%%%%%%
             %%%%%%%%%% - создаЄм новый алфавит из старого с помощью ключа
            Alphabet = ' јаЅб¬в√гƒд≈е®Є∆ж«з»и…й кЋлћмЌнќоѕп–р—с“т”у‘ф’х÷ц„чЎшўщЏъџы№ьЁэёюя€AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!?.,()-';
Len = length(Alphabet)
Alphabet2 = '';
num = get(Important,'String');    % - проверим наличие ключа дл€ расшифровки
        if length(num) == 0
            msgbox('¬ведите ключ!!!',' люч','Modal')   % - в случае отсутствие ключа наша программа работать не будет и об этом сообщат
   
        else        
Key = get(Important,'String'); % ключ
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

%%%%%%%%%%%%%%%%% далее расшифруем наш текст
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
            set(Text,'String',Words) % - наше исходное слово
             set(Toggle2,'String','¬озвращаем зашифрованный текст') % - просто изменим надпись на кнопке дл€ большей €сности
        end
        end
   end
%%%%%%%%%%%

uicontrol('Style','PushButton', ... % - создаЄм просто кнопку, присваиваем ей объект и определЄнное свойство PushButton
   'String', '—охранение текстового файла', ...             % - «адаЄм на ней свою надпись "—охранение текстового файла"
  'Position', [373, 150, 180, 30], ...  % - «адаЄм позицию кнопки, где первые два числа - это координаты, а далее ширина и высота кнопки    
  'CallBack',@thesavetext)   % - «адаЄм функцию CallBack и еЄ действие с помощью ссылки на функцию the savetext
%%%%%%%%%%%%%%%%%%%%
 function thesavetext(h,eventdata) % - сохран€ем наш текстовый файл
     Words = get(Text,'String');   % - присваиваем значение нашему новому файлу, а именно текст с объекта Text
        save text2 Words; % - сохран€ем текст из в новом m-файле
 end
%%%%%%%%%%%%%%%%%%%%

uicontrol('Style','PushButton', ... % - создаЄм просто кнопку, присваиваем еЄ —тилю определЄнное свойство PushButton
   'String', '«акрыть программу', ...             % - «адаЄм надпись на нЄм свою надпись «акрыть   
  'Position', [230, 30, 115, 30], ...  % - «адаЄм позицию кнопки, где первые два числа - это координаты, а далее ширина и высота кнопки    
  'CallBack','close')   % - «адаЄм функцию  CallBack и еЄ действие close - закрытие графического окна

   
end