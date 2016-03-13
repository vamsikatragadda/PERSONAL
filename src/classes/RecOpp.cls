Public Class RecOpp{
    public List<RecentlyViewed >oppList {get;set;}
    public RecOpp() {
        oppList = new List<RecentlyViewed >();
        oppList=[SELECT Id, Name FROM RecentlyViewed WHERE Type IN   ('Opportunity','Account') ORDER BY LastViewedDate DESC limit 10 ];
    }
    }