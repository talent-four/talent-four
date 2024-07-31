package talentFour.wonder.vo;

public class Pagination {
    private int currentPage;  // 현재 페이지 번호
    private int listCount;    // 전체 게시글 수
    
    private int limit = 10;        // 한 페이지에 보여질 게시글의 수
    private int pageSize = 10;     // 목록 하단 페이지 번호의 노출 개수
    
    private int maxPage;       // 제일 큰 페이지 번호 == 마지막 페이지 번호
    private int startPage;     // 목록 하단에 노출된 페이지의 시작 번호
    private int endPage;       // 목록 하단에 노출된 페이지의 끝 번호
    
    private int prevPage;      // 목록 하단에 노출된 번호의 이전 목록의 끝 번호
    private int nextPage;      // 목록 하단에 노출된 번호의 다음 목록의 시작 번호

    public Pagination(int currentPage, int listCount, int limit) {
        this.currentPage = currentPage;
        this.listCount = listCount;
        this.limit = limit;
        calculatePagination(); // 계산 메소드 호출
    }

    // Getter와 Setter
    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
        calculatePagination();
    }

    public int getListCount() {
        return listCount;
    }

    public void setListCount(int listCount) {
        this.listCount = listCount;
        calculatePagination();
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
        calculatePagination();
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
        calculatePagination();
    }

    public int getMaxPage() {
        return maxPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public int getPrevPage() {
        return prevPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public int getTotalPages() {
        return maxPage; // totalPages를 maxPage로 대체
    }

    @Override
    public String toString() {
        return "Pagination [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
                + ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
                + endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + "]";
    }

    private void calculatePagination() {
        maxPage = (int) Math.ceil((double) listCount / limit);
        startPage = ((currentPage - 1) / pageSize) * pageSize + 1;
        endPage = startPage + pageSize - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        prevPage = (currentPage <= pageSize) ? 1 : startPage - 1;
        nextPage = (endPage == maxPage) ? maxPage : endPage + 1;
    }

    public int getItemsPerPage() {
        return limit; // getItemsPerPage와 getLimit이 같은 값을 반환
    }
}
