class Solution {
    public long[] unmarkedSumArray(int[] nums, int[][] queries) {

        long[]ans=new long[queries.length];
        int ansidx=0;
        long total=0;

        PriorityQueue<int[]>pq=new PriorityQueue<>((a,b)->a[0]==b[0]?a[1]-b[1]:a[0]-b[0]);
        int n=nums.length;
        for(int i=0;i<n;i++){
            pq.add(new int[]{nums[i],i});
            total+=(long)nums[i];
        }


        long sum=0;
        for(int[]q:queries){
            int idx=q[0];
            int k=q[1];
            sum+=nums[idx];
            nums[idx]=0;

            while(pq.size()!=0 && k>0){
                int[] cur=pq.poll();
                int curval=nums[cur[1]];
                if(curval>0){
                    sum+=(long)curval;
                    nums[cur[1]]=0;
                    k--;
                }
                
            }
            ans[ansidx++]=total-sum;

        }

        return ans;

    }
}