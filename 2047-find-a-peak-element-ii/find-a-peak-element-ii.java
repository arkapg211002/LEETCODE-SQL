class Solution {
    public int[] findPeakGrid(int[][] mat) {
        // considering there is one peak in each row
        int rows = mat.length;
        int cols = mat[0].length;
        int startCol = 0;
        int endCol = cols - 1;
        int mid;
        while (startCol <= endCol) {
            mid = (startCol + endCol) / 2;
            // Find the max element in the mid column
            int maxRow = maxElementInCol(mat, mid);
            int left = mid - 1 >= 0 ? mat[maxRow][mid - 1] : -1;
            int right = mid + 1 < cols ? mat[maxRow][mid + 1] : -1;

            if (mat[maxRow][mid] > left && mat[maxRow][mid] > right) {
                return new int[] { maxRow, mid };
            } else if (mat[maxRow][mid] < left) {
                endCol = mid - 1;
            } else {
                startCol = mid + 1;
            }
        }
        return new int[] { -1, -1 };
    }

    int maxElementInCol(int[][] mat, int col) {
        int max = Integer.MIN_VALUE;
        int index = -1;
        for (int i = 0; i < mat.length; i++) {
            if (mat[i][col] > max) {
                max = mat[i][col];
                index = i;
            }
        }
        return index;
    }
}