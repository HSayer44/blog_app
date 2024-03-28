int calculatingReadingTime(String content) {
  final wordCount = content.split(RegExp(r'\s+')).length; //split spaces and new line charachter
  //time = distance/speed
  //reading speed = 225 words per minute
  final readingTime = wordCount / 225;
  return readingTime.ceil();
}
