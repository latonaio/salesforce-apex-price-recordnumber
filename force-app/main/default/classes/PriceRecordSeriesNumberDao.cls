public with sharing class PriceRecordSeriesNumberDao {

    //Singleton
    private static PriceRecordSeriesNumberDao dao;

    public static PriceRecordSeriesNumberDao getInstance() {
        if (dao == null) {
            dao = new PriceRecordSeriesNumberDao();
        }
        return dao;
    }

    /**
  * 価格レコード連続番号オブジェクトを取得します。
  *
  * @return List<PriceRecordSeriesNumber__c>
  */

    public List<PriceRecordSeriesNumber__c> getPriceRecordSeriesNumber() {
        List<PriceRecordSeriesNumber__c> price = [
                SELECT
                        price_type_id__c,
                        price_type_name__c,
                        price_record_no__c,
                        price_record_id__c,
                        OwnerId,
                        LastModifiedById,
                        end_date__c,
                        start_date__c,
                        create_date__c,
                        series_number__c,
                        price__c
                FROM PriceRecordSeriesNumber__c];

        if (price == null || price.IsEmpty()) {
            return null;
        }

        return price;

    }

    public List<PriceRecordSeriesNumber__c> getPriceRecordSeriesNumberByPriceRecordAndEndDate(String priceRecordId, Date targetDate) {
        List<PriceRecordSeriesNumber__c> price = [
                SELECT
                        price_type_id__c,
                        price_type_name__c,
                        price_record_no__c,
                        price_record_id__c,
                        OwnerId,
                        LastModifiedById,
                        end_date__c,
                        start_date__c,
                        create_date__c,
                        series_number__c,
                        price__c
                FROM PriceRecordSeriesNumber__c
                WHERE price_record_id__c =: priceRecordId AND ( end_date__c >: targetDate AND start_date__c <: targetDate)];

        if (price == null || price.IsEmpty()) {
            return null;
        }

        return price;

    }
}