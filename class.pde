class Player implements Comparable<Player> {
  public String Name;
  public int Score;

  public int compareTo(Player player) {    
    if (player.Score == Score)
    {
      //println("p1(" + player.Score + ") == p2(" + this.Score + ")");
      return 0;
    } else if (player.Score < Score)
    {
      //println("p1(" + player.Score + ") < p2(" + this.Score + ")");
      return -1;
    } else
    {
      //println("p1(" + player.Score + ") > p2(" + this.Score + ")");
      return 1;
    }
  }
  
  public String print(){
  String returnValue = Name + " - " + Score;
  return returnValue;
  }
}
