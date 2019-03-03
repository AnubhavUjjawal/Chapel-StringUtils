// isPangram tests
use StringUtils;

// all testcase should return false;
if  isPangram('hello world') ||
    isPangram('Hello World') {
        exit(1);
    }

// all testcase should return true;
if !isPangram('The quick brown fox jumps over the lazy dog'){
        exit(1);
    }