clear all
fclose all;
close all
clc

% Aybuke Buket Akgul
% 1.05.15
% Voluntary Homework #2 Blackjack

% print the first statement
fprintf('You have 100 chips. ');
chips=100;
% ask user to how much s/he bet
n=input('How much do you want to bet? ');
% if user enters a negatif or noninteger, warn user and ask again
while n<=0 || ceil(n)~=n
    fprintf('You must give a positive whole number.');
    n=input('How much do you want to bet? ');
end
% if user enters a number bigger than chips, warn user and ask again
while n>chips
    fprintf('You cannot bet chips grater than you have.');
    n=input('How much do you want to bet? ');
end
% select random cards, and add them in an array
x=RandomCard();
y=RandomCard();
CK=[x y];
% print computer's cards
fprintf('Computer''s cards: ');
ShowHand(CK,1);
fprintf('\n');
% select random cards, and add them in  an array
x=RandomCard();
y=RandomCard();
YC=[x y];
% print user's cards
fprintf('Your cards: ');
ShowHand(YC,2);
fprintf('\n');
c=2;
d=0;
% if sum is less than 21 and user has cards lass than 5, ask them if s/he
% wants a card, if s/he says no, dont ask them again
while SumHand(YC)<21 && c<5 && d==0
    t=input('Do you want a card (Y/N)? ','s');
    while t(1)~='Y' && t(1)~='y' && t(1)~='N' && t(1)~='n'
        fprintf('Not a valid answer.');
        t=input('Do you want a card (Y/N)? ','s');
    end
    if t(1)=='Y' || t(1)=='y'
        x=RandomCard();
        YC=[YC x];
        fprintf('Your Cards: ');
        ShowHand(YC,2);
        fprintf('\n');
    elseif t(1)=='N' || t(1)=='n'
        d=2;
    end
    c=c+1;
end
% if sum is grater than 21, print they lose and number of chips
if SumHand(YC)>21
    chips=chips-n;
    fprintf('You Busted! Now you have %g chips.\n', chips);
elseif c==5
    disp('You have 5 cards. ');
end
% if sum is less than 21, show computer's turn
if SumHand(YC)<=21
    fprintf('Now it is computer''s turn...\n');
    fprintf('Computer''s cards: ');
    ShowHand(CK,2);
    fprintf('\n');
    fprintf('Sum: %g \n',SumHand(CK));
    c=2;
    % while sum less than 17 and computer has cards less than 5, select
    % cards
    while SumHand(CK)<17 && c<5
        fprintf('Computer hits.\n');
        c=c+1;
        x=RandomCard();
        CK=[CK x];
        fprintf('Computer''s cards: ');
        ShowHand(CK,2);
        fprintf('\n');
        fprintf('Sum: %g \n',SumHand(CK));
    end
    % if computer's sum is grater than 21, print user won and number of
    % chips
    if SumHand(CK)>21
        chips=chips+n;
        fprintf('Computer busts! Now you have %g chips.\n',chips);
        % if computer's sum is grater than or equal to user's sum, print
        % computer won and number of chips
    elseif SumHand(CK)>=SumHand(YC)
        chips=chips-n;
        fprintf('You Busted! Now you have %g chips.\n', chips);
        % if computer's sum is less tha user's sum, print user won and
        % number of chips
    elseif SumHand(CK)<SumHand(YC)
        chips=chips+n;
        fprintf('Computer busts! Now you have %g chips.\n',chips);
    end
end
% if user has chips grater than 0, ask user if s/he wants to play again.
if chips>0
    b=input('Do you want to play again (Y/N)? ','s');
    % if user enters an invalid answer, ask them again.
    while b(1)~='Y' && b(1)~='y' && b(1)~='N' && b(1)~='n'
        fprintf('Not a valid answer.');
        b=input('Do you want to play again (Y/N)? ','s');
    end
end


% if user enters y, continue the game
if b(1)=='Y' || b(1)=='y'
    while chips>0 && b(1)~='N' && b(1)~='n'
        fprintf('You have %g chips. ',chips);
        n=input('How much do you want to bet? ');
        % if user enters a negatif or noninteger, warn user and ask again
        while n<=0 || ceil(n)~=n
            fprintf('You must give a positive whole number.');
            n=input('How much do you want to bet? ');
        end
        % if user enters a number bigger than chips, warn user and ask again
        while n>chips
            fprintf('You cannot bet chips grater than you have.');
            n=input('How much do you want to bet? ');
        end
        % select random cards, and add them in an array
        x=RandomCard();
        y=RandomCard();
        CK=[x y];
        % print computer's cards
        fprintf('Computer''s cards: ');
        ShowHand(CK,1);
        fprintf('\n');
        % select random cards, and add them in  an array
        x=RandomCard();
        y=RandomCard();
        YC=[x y];
        % print user's cards
        fprintf('Your cards: ');
        ShowHand(YC,2);
        fprintf('\n');
        c=2;
        d=0;
        % if sum is less than 21 and user has cards lass than 5, ask them if s/he
        % wants a card, if s/he says no, dont ask them again
        while SumHand(YC)<21 && c<5 && d==0
            t=input('Do you want a card (Y/N)? ','s');
            while t(1)~='Y' && t(1)~='y' && t(1)~='N' && t(1)~='n'
                fprintf('Not a valid answer.');
                t=input('Do you want a card (Y/N)? ','s');
            end
            if t(1)=='Y' || t(1)=='y'
                x=RandomCard();
                YC=[YC x];
                fprintf('Your Cards: ');
                ShowHand(YC,2);
                fprintf('\n');
            elseif t(1)=='N' || t(1)=='n'
                d=2;
            end
            c=c+1;
        end
        % if sum is grater than 21, print they lose and number of chips
        if SumHand(YC)>21
            chips=chips-n;
            fprintf('You Busted! Now you have %g chips.\n', chips);
        elseif c==5
            disp('You have 5 cards. ');
        end
        % if sum is less than 21, show computer's turn
        if SumHand(YC)<=21
            fprintf('Now it is computer''s turn...\n');
            fprintf('Computer''s cards: ');
            ShowHand(CK,2);
            fprintf('\n');
            fprintf('Sum: %g \n',SumHand(CK));
            c=2;
            % while sum less than 17 and computer has cards less than 5, select
            % cards
            while SumHand(CK)<17 && c<5
                fprintf('Computer hits.\n');
                c=c+1;
                x=RandomCard();
                CK=[CK x];
                fprintf('Computer''s cards: ');
                ShowHand(CK,2);
                fprintf('\n');
                fprintf('Sum: %g \n',SumHand(CK));
            end
            % if computer's sum is grater than 21, print user won and number of
            % chips
            if SumHand(CK)>21
                chips=chips+n;
                fprintf('Computer busts! Now you have %g chips.\n',chips);
                % if computer's sum is grater than or equal to user's sum, print
                % computer won and number of chips
            elseif SumHand(CK)>=SumHand(YC)
                chips=chips-n;
                fprintf('You Busted! Now you have %g chips.\n', chips);
                % if computer's sum is less tha user's sum, print user won and
                % number of chips
            elseif SumHand(CK)<SumHand(YC)
                chips=chips+n;
                fprintf('Computer busts! Now you have %g chips.\n',chips);
            end
        end
        % if chips ae grater than 0, ask user if s/he wants to play again
        if chips>0
            b=input('Do you want to play again (Y/N)? ','s');
            while b(1)~='Y' && b(1)~='y' && b(1)~='N' && b(1)~='n'
                fprintf('Not a valid answer.');
                b=input('Do you want to play again (Y/N)? ','s');
            end
        end
    end
end
%display goodbye message
disp('Goodbye!');
