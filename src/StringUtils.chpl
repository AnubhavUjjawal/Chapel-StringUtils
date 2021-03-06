/* 
  Package containing several utils functions for strings 
*/
module StringUtils {
  use Regexp;
  

  /*
    Email Regex in chapel
  */
  private var emailRe: regexp;

  /*
    Camel Case Regex in Chapel
  */
  private var camelCaseTestRe: regexp;

  /*
    IP Regex in chapel
  */
  private var IPRe: regexp;

  /*
    Spaces Regex in chapel
  */
  private var spacesRe: regexp;

  /*
    A string containing all lowercase letters of english alphabet
  */
  private var lettersString = "abcdefghijklmnopqrstuvwxyz";

  try! {
    emailRe = compile("^[a-zA-Z\\d\\._\\+-]+@([a-z\\d-]+\\.?[a-z\\d-]+)+\\.[a-z]{2,4}$");
    camelCaseTestRe = compile("^[a-zA-Z]*([a-z]+[A-Z]+|[A-Z]+[a-z]+)[a-zA-Z\\d]*$");
    IPRe = compile("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$");
    spacesRe = compile("\\s");
  }
  
  /*
    :arg str: string to be converted to Array
    :type str: string

    :returns: a array with each character of string separately in array.
  */
  proc strToArr(str: string) {
    var len = str.size;
    var arr: [1..len] string;
    for i in 1..len {
      arr[i] = str[i];
    }
    return arr;
  }

  /*
    :arg str: string to be converted to Domain
    :type str: string

    :returns: a domain with each character of string in Domain.
  */
  proc strToDomain(str: string) {
    var len = str.size;
    var dom: domain(string);
    for i in 1..len {
      dom.add(str[i]);
    }
    return dom;
  }

  var lettersArr = strToArr(lettersString);
  var lettersSet = strToDomain(lettersString);

  /*
    :arg obj: object to test

    :returns:  If obj is not empty string when typecasted to string, returns true, else false.

  */
  proc isFullString(obj): bool {
    if !isString(obj) {
      return false;
    }
    var obj2 = obj:string;
    return !obj2.isEmptyString();
  }

  /*
    :arg str: string to test
    :type str: string

    :returns:  If str is valid email, returns true, else false.

  */
  proc isEmail(str: string): bool {
    return isFullString(str) && emailRe.match(str).matched;
  }

  /*
    :arg str: string to test
    :type str: string

    :returns:  If str is valid CamelCase returns true, else false.

  */
  proc isCamelCase(str: string): bool {
    return isFullString(str) && camelCaseTestRe.match(str).matched;
  }

  /*
    :arg str: string to test
    :type str: string

    :returns:  If str is IP, returns true, else false.

  */
  proc isIP(str: string): bool {
    return isFullString(str) && IPRe.match(str).matched;
  }

  /*
    :arg str: string to test
    :type str: string

    :returns:  If str is palindrome, returns true, else false.

  */
  proc isPalindrome(str: string): bool {
    var len = str.size;
    for i in 1..len/2 {
      if str[i] != str[len+1-i] {
        return false;
      }
    }
    return true;
  }

  /*
    :arg str: string to test
    :type str: string

    :returns:  If str is pangram, returns true, else false.

  */
  proc isPangram(str: string): bool {
    var toCheck = strToDomain(spacesRe.sub('', str.toLower()));
    return toCheck.isSuper(lettersSet);
  }

  /*
    :arg str: string to test
    :type str: string

    :returns:  If str is isogram, returns true, else false.

  */
  proc isIsogram(str: string): bool {
    var strLower = str.toLower();
    return strLower.size == strToDomain(strLower).size; 
  }

  /*
    :arg str1: first string
    :arg str2: second string 
    :type str1: string
    :type str2: string

    :returns: 2D DP Array of LCS of size [1..str1.size+1, 1..str2.size+1]

  */
  proc lcsDPTable(str1: string, str2: string) {
    var dpTable: [1..str1.size+1, 1..str2.size+1] int, i, j: int;
    const n = str1.size;
    const m = str2.size;
    var lcs: string;
    for i in 1..n {
        for j in 1..m {
            if str1[i] == str2[j] {
                dpTable[i+1, j+1] = dpTable[i, j] + 1;
            } else {
                dpTable[i+1, j+1] = max(dpTable[i+1, j], dpTable[i, j+1]);
            }
        }
    }
    return dpTable;
  }

  private proc lcsTrim(str1: string, str2: string) {
    var n = str1.size;
    var m = str2.size;
    var start = 1;
    var endRemove = 0, startRemove = 0;
    while start <= n  && start <= m && str1[start] == str2[start] {
        start += 1;
        startRemove += 1;
    }
    while start <= n  && start <= m && str1[n] == str2[m] {
        n -= 1;
        m -= 1;
        endRemove += 1;
    }
    return [startRemove, endRemove];
  }

  /*
    :arg str1: first string 
    :arg str2: second string 
    :type str1: string
    :type str2: string

    :returns:  length of lcs of str1 and str2.

  */
  proc lcsLength(in str1: string, in str2: string): int {
    var trimIndexes = lcsTrim(str1, str2);
    var  n = str1.size+1;
    var  m = str2.size+1;
    str1 = str1[1+trimIndexes[1]..n-1-trimIndexes[2]];
    str2 = str2[1+trimIndexes[1]..m-1-trimIndexes[2]];
    n = str1.size+1;
    m = str2.size+1;
    return lcsDPTable(str1, str2)[str1.size+1, str2.size+1] + trimIndexes[1] + trimIndexes[2];
  }

  /*
    :arg str1: first string 
    :arg str2: second string 
    :type str1: string
    :type str2: string

    :returns:  longest common subsequence of str1 and str2.

  */
  proc lcs(in str1: string, in str2: string): string {
    var trimIndexes = lcsTrim(str1, str2);
    var  n = str1.size+1;
    var  m = str2.size+1;
    var  i=n, j=m;
    var prefix="", suffix="";

    if(trimIndexes[1]) {
        prefix = str1[1..trimIndexes[1]];
    }
    if(trimIndexes[2]) {
        suffix = str1[n-trimIndexes[2]..n-1];
    }
    str1 = str1[1+trimIndexes[1]..n-1-trimIndexes[2]];
    str2 = str2[1+trimIndexes[1]..m-1-trimIndexes[2]];
    
    var dpTable = lcsDPTable(str1, str2);
    n = str1.size+1;
    m = str2.size+1;
    i=n; j=m;
    var lcsString = "";
    while i!=1 && j!=1 {
        if dpTable[i, j] == dpTable[i-1, j] {
            i -= 1;
        }
        else if  dpTable[i, j] == dpTable[i, j-1] {
            j -= 1;
        }
        else {
            lcsString = str1[i-1] + lcsString;
            i -= 1;
            j -= 1;
        }
        
    }
    return prefix + lcsString + suffix;
  }
}
