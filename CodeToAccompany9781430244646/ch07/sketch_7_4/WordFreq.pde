/*------------------------------------------------------------
Copyright (c) 2013, Friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
Friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/

// Sketch 7-4: Using ArrayLists for word frequencies
//                       And eliminating stop words 
//                       And using the WordFreq class

// Sketch 7-4a: The Word frequency table class
class WordFreq {
  // A Frequency table class for Words
  ArrayList<Word> wordFrequency;
  String [] stopWords = loadStrings("stopwords.txt");

  WordFreq(String[] tokens) {  // Constructor

    wordFrequency = new ArrayList();
    // Compute the wordFrequency table using tokens
    for (String t : tokens) {
      if (!_isStopWord(t)) {
        // See if token t is already a known word
        int index = _search(t, wordFrequency);
        if (index >= 0) {
          ( wordFrequency.get(index)).incr();
        }
        else {
          wordFrequency.add(new Word(t));
        }
      }
    } // for
  } // WordFreq()
  void tabulate() {  // console printout
    int n = wordFrequency.size();
    println("There are "+N()+" entries.");
    for (int i=0; i < n; i++) {
      println(wordFrequency.get(i));
    }
  } // tabulate
  int N() { // Number of table entries
    return wordFrequency.size();
  } // N()
  String[] samples() {  // Returns all the words
    String [] k = new String[N()];
    int i=0;
    for (Word w : wordFrequency) {
      k[i++] = w.getWord();
    }
    return k;
  } // samples()
  int[] counts() {  // Returns all the frequencies
    int [] v = new int[N()];
    int i=0;
    for (Word w : wordFrequency) {
      v[i++] = w.getFreq();
    }
    return v;
  } // counts()
  int maxFreq() {  // The max frequency
    return max(counts());
  } // maxFreq()

  int _search(String w, ArrayList<Word> L) {
    // search for word w  in L.
    // Returns index of w in L if found, -1 o/w
    for (int i=0; i < L.size(); i++) {
      if (L.get(i).getWord().equals(w))
        return i;
    }
    return -1;
  } // _search()

  boolean _isStopWord(String word) {  // Is word a stop word?
    for (String stopWord : stopWords) {
      if (word.equals(stopWord)) {
        return true;
      }
    }
    return false;
  } // _isStopWord()

  String toString() {  // Print representation
    return "Word Frequency Table with"+N()+" entries.";
  } // toString()
} // class WordFreq
