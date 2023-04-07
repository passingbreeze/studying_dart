typedef wordList = List<String>;
typedef strDict = Map<String, String>;
typedef bulkDictList = List<strDict>;

class Dictionary {
  late final Map<String, String> _wordlist;

  Dictionary() {
    this._wordlist = strDict();
  }

  void add({required String term, required String definition}) {
    _wordlist.addAll({term: definition});
  }

  String? get(String term) {
    return _wordlist[term] ?? "${term} not found in Dictionary";
  }

  void delete({required String term}) {
    exists(term: term)
        ? _wordlist.remove(term)
        : print("Cannot Delete unavailable key.");
  }

  void update({required String term, required String definition}) {
    _wordlist.update(
      term,
      (value) => definition,
      ifAbsent: () => throw Exception(["${term} not found in Dictionary"]),
    );
  }

  void showAll() {
    print(_wordlist.toString());
  }

  int count() => _wordlist.length;

  void upsert({required String term, required String definition}) {
    _wordlist.update(
      term,
      (value) => definition,
      ifAbsent: () => definition,
    );
  }

  bool exists({required String term}) => _wordlist.containsKey(term);

  void bulkAdd({required bulkDictList bulkDictList}) {
    for (var word in bulkDictList) {
      this.add(term: word['term']!, definition: word['definition']!);
    }
    print("Complete to bulk add");
  }

  void bulkDelete({required wordList words}) {
    for (var word in words) {
      this.delete(term: word);
    }
    print("Complete to Delete ${words}");
  }
}

void main(List<String> args) {
  var ex = Dictionary();
  ex.add(term: "피카츄", definition: "전기 포켓몬");
  ex.add(term: "라이츄", definition: "피카츄가 진화한 포켓몬");
  ex.showAll();
  print(ex.count());
  print(ex.get("피카츄"));
  ex.delete(term: "라이츄");
  ex.exists(term: "라이츄") ? print(ex.get("라이츄")) : print("라이츄 없다");
  ex.update(term: "피카츄", definition: "1세대 전기 포켓몬.");
  ex.showAll();
  ex.upsert(term: "피카츄", definition: "1세대 전기 포켓몬. 지우가 데리고 다닌다.");
  ex.upsert(term: "라이츄", definition: "피카츄가 진화한 포켓몬이지만 작품에서는 잘 등장하지 않는다.");
  print(ex.count());
  ex.showAll();
  ex.bulkAdd(bulkDictList: [
    {"term": "파이리", "definition": "1세대 불 포켓몬"},
    {"term": "꼬부기", "definition": "1세대 물 포켓몬"}
  ]);
  ex.showAll();
  print(ex.count());
  ex.bulkDelete(words: ["피카츄", "라이츄"]);
  ex.showAll();
  print(ex.count());
}
