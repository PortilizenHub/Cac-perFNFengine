package;

class HelpfulFunctions
{
    inline static public function add(num1:Int, num2:Int)
        {
            return num1 += num2;
        } 

    inline static public function subtract(num1:Int, num2:Int)
        {
            return num1 -= num2;
        } 
    
    inline static public function multiply(num1:Int, num2:Int)
        {
           return num1 *= num2;
        } 
    inline static public function divide(num1:Int, num2:Int)
        {
            return Std.int(num1/num2);
        }
}