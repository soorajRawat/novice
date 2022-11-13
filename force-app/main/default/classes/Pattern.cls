public class Pattern {
    public static string patternStyle(integer one,integer two) {
        string equal=' ';
        string hyphen=' ';
        for(integer i=1;i<=one;i++){
            equal=equal+'=';
        }
        for(integer i=1;i<=two;i++){
            hyphen=hyphen+'-';
    }
    return equal+'\n'+hyphen+'\n'+equal;
}
}