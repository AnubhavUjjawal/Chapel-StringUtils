// lcs tests
use StringUtils;

if  lcs('GeeksforGeeks', 'GeeksQuiz') != 'Geeks' ||
  lcs('abcdxyz', 'xyzabcd') != 'abcd' ||
  lcs('zxabcdezy', 'yzabcdezx') != 'zabcdez' {
    exit(1);
  }

if  lcsLength('GeeksforGeeks', 'GeeksQuiz') != 5 ||
  lcsLength('abcdxyz', 'xyzabcd') != 4 ||
  lcsLength('zxabcdezy', 'yzabcdezx') != 7 {
    exit(1);
  }
