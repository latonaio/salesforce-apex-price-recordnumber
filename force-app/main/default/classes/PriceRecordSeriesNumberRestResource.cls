/**
 * 価格レコードオブジェクトのREST
 *
 */
@RestResource(urlMapping='/PriceRecordSeriesNumber/*')
global with sharing class PriceRecordSeriesNumberRestResource {

    /**
     * 価格レコード連続番号を取得します。
     *
     * @return priceMaster
     */
    @HttpGet
    global static List<PriceRecordSeriesNumber__c> doGetPriceRecordSeriesNumber() {
        RestRequest req = RestContext.request;

        //クエリパラメータがnullでない場合
        String prId = req.params.get('price_record_id');
        String d = req.params.get('date');
        PriceRecordSeriesNumberDao dao = PriceRecordSeriesNumberDao.getInstance();
        List<PriceRecordSeriesNumber__c> ps = new List<PriceRecordSeriesNumber__c>();

        if (prId != null && d != null) {
            Date target = Date.valueOf(d);
            ps = dao.getPriceRecordSeriesNumberByPriceRecordAndEndDate(prId, target);
            return ps;
        }

        ps = dao.getPriceRecordSeriesNumber();
        return ps;
    }
}