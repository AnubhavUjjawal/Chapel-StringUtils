// isPalindrome tests
use StringUtils;

// all testcase should return false;
if  isPalindrome('abcde') ||
  isPalindrome('abcd') {
    exit(1);
}

// all testcase should return true;
if !isPalindrome('aabaa') ||
  !isPalindrome('abba') ||
  !isPalindrome('a') ||
  !isPalindrome('') {
    exit(1);
}
