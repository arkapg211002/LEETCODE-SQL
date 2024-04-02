class Pair {
    char ch;
    int num;

    public Pair(char ch, int num) {
        this.ch = ch;
        this.num = num;
    }
}

class PairComparator implements Comparator<Pair> {
    @Override
    public int compare(Pair e1, Pair e2) {
        if (e1.num != e2.num) {
            return Integer.compare(e1.num, e2.num);
        } else {
            return Character.compare(e1.ch, e2.ch);
        }
    }
}


class Solution {
    public String minimizeStringValue(String s) {
        PriorityQueue<Pair> pq = new PriorityQueue<>(new PairComparator());
        int[] arr=new int[26];

        for(int i=0;i<s.length();i++){
            char ch=s.charAt(i);
            if(ch!='?'){
                arr[ch-'a']++;
            }
        }
        for(char i='a';i<='z';i++){
            pq.add(new Pair(i,arr[i-'a']));
        }

        StringBuilder str=new StringBuilder();
        for(int i=0;i<s.length();i++){
            char chr=s.charAt(i);
            if(chr=='?'){
                Pair top=pq.poll();
                int num=top.num;
                char ch=top.ch;
                pq.add(new Pair(ch,num+1));
                str.append(ch);
            }
        }

        // sorting the characters for the testcase
        // abcdefghijklmnopqrstuvwxy?? --- za or az?
        // ans: za

        char[] charr=str.toString().toCharArray();
        Arrays.sort(charr);
        StringBuilder str2=new StringBuilder(2);
        int idx=0;
        for(int i=0;i<s.length();i++){
            char ch=s.charAt(i);
            if(ch=='?'){
                str2.append(charr[idx++]);
            }
            else{
                str2.append(ch);
            }
        }
    return str2.toString();

    }
}