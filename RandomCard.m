function x=RandomCard()
x=randi(13);
switch x
    case 1
        x='A';
    case 11
        x='J';
    case 12
        x='Q';
    case 13
        x='K';
end
