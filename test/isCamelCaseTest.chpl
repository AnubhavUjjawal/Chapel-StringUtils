// isCamelCase tests
use StringUtils;

// all testcase should return false;
if isCamelCase('lowercase') ||
  isCamelCase('UPPERCASE') ||
  isCamelCase(' CamelCase ') ||
  isCamelCase('1000Times') ||
  isCamelCase('<#NotCamelCaseHere!?>') {
    exit(1);
}

// all testcase should return true;
if !isCamelCase('Camel') ||
  !isCamelCase('CamelCase') ||
  !isCamelCase('camelCase') ||
  !isCamelCase('CamelCaseTOO') ||
  !isCamelCase('ACamelCaseIsAlsoAStringLikeThis1') ||
  !isCamelCase('camelCaseStartingLowerEndingUPPER') {
    exit(1);
}
